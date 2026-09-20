local HISTORY_DIR = rime_api.get_user_data_dir() .. "/input_history"

local current_minute
local current_text = ""

local function make_dir()
    if package.config:sub(1, 1) == "\\" then
        os.execute('if not exist "' .. HISTORY_DIR .. '" mkdir "' .. HISTORY_DIR .. '"')
    else
        os.execute('mkdir -p "' .. HISTORY_DIR .. '"')
    end
end

local function flush()
    if not current_minute or current_text == "" then
        return
    end

    local date = current_minute:sub(1, 10)
    local time = current_minute:sub(12)

    local file = io.open(
        HISTORY_DIR .. "/" .. date .. ".txt",
        "a"
    )

    if not file then
        return
    end

    file:write("[", time, "] ", current_text, "\n")
    file:close()

    current_text = ""
end

local function record(text)
    if not text or text == "" then
        return
    end

    text = text:gsub("[\r\n]+", "\\n")

    local minute = os.date("%Y-%m-%d %H:%M")

    if current_minute ~= minute then
        flush()
        current_minute = minute
    end

    current_text = current_text .. text
end

local function init(env)
    make_dir()

    env.engine.context.commit_notifier:connect(function(context)
        record(context:get_commit_text())
    end)
end

local function fini()
    flush()
end

local function processor()
    return 2
end

return {
    init = init,
    func = processor,
    fini = fini,
}
