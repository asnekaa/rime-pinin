local MARK = "～"
local CUSTOM_PHRASE_FILE = rime_api.get_user_data_dir() .. "/custom_phrase/pinin.txt"

local custom_entries = {}

local function load_custom_phrase()
    local file = io.open(CUSTOM_PHRASE_FILE, "r")
    if not file then
        return
    end

    for line in file:lines() do
        if line:sub(1, 1) ~= "#" then
            local text, code = line:match("^(.-)\t([^\t]+)")
            if text and code then
                local entries = custom_entries[text]
                if not entries then
                    entries = {}
                    custom_entries[text] = entries
                end
                entries[code] = true
            end
        end
    end

    file:close()
end

local function filter(input)
    for cand in input:iter() do
        local genuine = cand:get_genuine()

        if genuine and genuine.type == "user_table" then
            local text = genuine.text
            local preedit = genuine.preedit

            if custom_entries[text]
                and custom_entries[text][preedit]
                and preedit:sub(-#MARK) ~= MARK then
                genuine.preedit = preedit .. MARK
            end
        end

        yield(cand)
    end
end

local function init()
    load_custom_phrase()
end

return {
    init = init,
    func = filter,
}
