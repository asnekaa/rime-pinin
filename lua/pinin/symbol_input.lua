local M = {}

local TONE_MAP = {
    ['1'] = 'ẑ',
    ['2'] = 'ĉ',
    ['3'] = 'ŝ',
    ['4'] = '-',
    ['5'] = '/',
    ['6'] = '|',
    ['7'] = '\\',
    ['8'] = '_',
    ['9'] = 'ñ',
    ['0'] = 'ŋ',
    ['grave'] = '·',
}

local SYM_SET = {}
for _, v in pairs(TONE_MAP) do
    SYM_SET[v] = true
end

local function replace_input(ctx, new_input)
    ctx:clear()
    if new_input ~= '' then
        ctx:push_input(new_input)
    end
end

function M.func(key, env)
    if key:release() then
        return 2
    end

    local repr = key:repr()
    local ctx = env.engine.context
    local input = ctx.input

    if ctx:get_option('ascii_mode') then
        return 2
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

    local sym = TONE_MAP[repr]
    if not sym then
        return 2
    end

    replace_input(ctx, input .. sym)
    return 1
end

return M
