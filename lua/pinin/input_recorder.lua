local HISTORY_DIR = rime_api.get_user_data_dir() .. "/input_history"

local minute
local buffer = {}
local buffer_size = 0
local file
local date

local function make_dir()
    if package.config:sub(1, 1) == "\\" then
        os.execute('if not exist "' .. HISTORY_DIR .. '" mkdir "' .. HISTORY_DIR .. '"')
    else
        os.execute('mkdir -p "' .. HISTORY_DIR .. '"')
    end
end

local function open_file(current_date)
    if file then
        file:close()
    end

    date = current_date
    file = io.open(HISTORY_DIR .. "/" .. date .. ".txt", "a")
end

local function flush()
    if not minute or buffer_size == 0 then
        return
    end

    local timestamp = minute
    local current_date = os.date("%Y-%m-%d", timestamp)

    if not file or date ~= current_date then
        open_file(current_date)
    end

    if file then
        file:write(
            "[",
            os.date("%H:%M", timestamp),
            "] ",
            table.concat(buffer, "", 1, buffer_size),
            "\n"
        )
        file:flush()
    end

    buffer = {}
    buffer_size = 0
end

local function append(text)
    if not text or text == "" then
        return
    end

    local now = os.time()
    local current_minute = now - now % 60

    if minute ~= current_minute then
        flush()
        minute = current_minute
    end

    buffer_size = buffer_size + 1
    buffer[buffer_size] = text:gsub("[\r\n]+", "\\n")
end

local function init(env)
    make_dir()

    env.engine.context.commit_notifier:connect(function(context)
        append(context:get_commit_text())
    end)
end

local function fini()
    flush()

    if file then
        file:close()
        file = nil
    end
end

local function processor()
    return 2
end

return {
    init = init,
    func = processor,
    fini = fini,
}
