local M = {}

local TONE_MAP = {
    ['1'] = 'ẑ',
    ['2'] = 'ĉ',
    ['3'] = 'ŝ',
    ['9'] = 'ñ',
    ['0'] = 'ŋ',
    ['4'] = '-',
    ['5'] = '/',
    ['6'] = '|',
    ['7'] = '\\',
    ['8'] = '_',
    ['grave'] = '·',
}

local KEYCODE_MAP = {
    [33] = '1',
    [64] = '2',
    [35] = '3',
    [40] = '9',
    [41] = '0',
}

local SHIFT_MAP = {
    [33] = 'Ẑ',
    [64] = 'Ĉ',
    [35] = 'Ŝ',
    [40] = 'Ñ',
    [41] = 'Ŋ',
}

local DOT_SHIFT_MAP = {
    [33] = '！',
    [64] = '@',
    [35] = '#',
    [40] = '（',
    [41] = '）',
}

local REVERSE_MAP = {}
local SYM_SET = {}

for key, value in pairs(TONE_MAP) do
    REVERSE_MAP[value] = key
    SYM_SET[value] = true
end

for keycode, value in pairs(SHIFT_MAP) do
    REVERSE_MAP[value] = KEYCODE_MAP[keycode]
    SYM_SET[value] = true
end

local function replace_input(ctx, input)
    ctx:clear()

    if input ~= '' then
        ctx:push_input(input)
    end
end

local function restore_original(input)
    local result = {}

    for char in input:gmatch('[%z\1-\127\194-\244][\128-\191]*') do
        result[#result + 1] = REVERSE_MAP[char] or char
    end

    return table.concat(result)
end

local function commit_first_candidate(ctx, env)
    if not ctx:has_menu() then
        return false
    end

    local segment = ctx.composition:back()

    if not segment then
        return false
    end

    local candidate = segment:get_candidate_at(0)

    if not candidate or not candidate.text or candidate.text == '' then
        return false
    end

    env.engine:commit_text(candidate.text)
    ctx:clear()

    return true
end

function M.func(key, env)
    if key:release() then
        return 2
    end

    local ctx = env.engine.context
    local input = ctx.input
    local repr = key:repr()

    if ctx:get_option('ascii_mode') then
        return 2
    end

    if repr == '.' or repr == 'period' or repr == 'KP_Decimal' then
        if input == '' then
            return 2
        end

        env.engine:commit_text(restore_original(input))
        ctx:clear()
        return 1
    end

    if repr == 'BackSpace' then
        if input == '' then
            return 2
        end

        local last_char = input:match('[%z\1-\127\194-\244][\128-\191]*$')

        if not last_char or not SYM_SET[last_char] then
            return 2
        end

        replace_input(ctx, input:sub(1, #input - #last_char))
        return 1
    end

    if input:sub(1, 1) == '.' then
        if key:shift() then
            local sym = DOT_SHIFT_MAP[key.keycode]

            if sym then
                env.engine:commit_text(sym)
                ctx:clear()
                return 1
            end
        end

        return 2
    end

    if key:shift() then
        local sym = SHIFT_MAP[key.keycode]

        if not sym then
            return 2
        end

        if input ~= '' then
            commit_first_candidate(ctx, env)
        end

        env.engine:commit_text(sym)
        return 1
    end

    local sym = TONE_MAP[repr]

    if not sym then
        return 2
    end

    replace_input(ctx, input .. sym)
    return 1
end

return M
