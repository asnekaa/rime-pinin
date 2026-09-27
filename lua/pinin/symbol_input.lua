local M = {}

local DEBUG_FILE = rime_api.get_user_data_dir() .. "/pinin_debug.txt"

local function debug_log(...)
    local file = io.open(DEBUG_FILE, "a")
    if not file then
        return
    end

    local args = {...}
    local parts = {}

    for i, v in ipairs(args) do
        parts[#parts + 1] = tostring(v)
    end

    file:write(
        os.date("%Y-%m-%d %H:%M:%S") ..
        " | " ..
        table.concat(parts, " | ") ..
        "\n"
    )

    file:flush()
    file:close()
end

local function bytes_to_hex(s)
    if not s then
        return "nil"
    end

    local result = {}

    for i = 1, #s do
        result[#result + 1] = string.format("%02X", string.byte(s, i))
    end

    return table.concat(result, " ")
end

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
        debug_log("commit_first_candidate", "no menu")
        return false
    end

    local segment = ctx.composition:back()

    if not segment then
        debug_log("commit_first_candidate", "no segment")
        return false
    end

    local candidate = segment:get_candidate_at(0)

    if not candidate or not candidate.text or candidate.text == '' then
        debug_log("commit_first_candidate", "no candidate")
        return false
    end

    debug_log(
        "commit_first_candidate",
        "candidate=" .. candidate.text,
        "candidate_hex=" .. bytes_to_hex(candidate.text)
    )

    env.engine:commit_text(candidate.text)
    ctx:clear()

    return true
end

function M.func(key, env)

    local ctx = env.engine.context
    local input = ctx.input
    local repr = key:repr()

    -- ========================================
    -- 原始键事件调试
    -- ========================================

    local keycode = key.keycode
    local modifier = key:modifier()

    local shift = key:shift()
    local release = key:release()
    local ctrl = key:ctrl()
    local alt = key:alt()
    local caps = key:caps()
    local super = key:super()

    debug_log(
        "================ KEY ================",
        "repr=" .. tostring(repr),
        "repr_hex=" .. bytes_to_hex(repr),
        "keycode=" .. tostring(keycode),
        "keycode_hex=" .. string.format("0x%X", keycode),
        "modifier=" .. tostring(modifier),
        "modifier_hex=" .. string.format("0x%X", modifier),
        "shift=" .. tostring(shift),
        "release=" .. tostring(release),
        "ctrl=" .. tostring(ctrl),
        "alt=" .. tostring(alt),
        "caps=" .. tostring(caps),
        "super=" .. tostring(super),
        "input=" .. tostring(input),
        "input_hex=" .. bytes_to_hex(input),
        "ascii_mode=" .. tostring(ctx:get_option('ascii_mode'))
    )

    -- ========================================
    -- release
    -- ========================================

    if release then
        debug_log("BRANCH", "release -> return 2")
        return 2
    end

    -- ========================================
    -- ascii mode
    -- ========================================

    if ctx:get_option('ascii_mode') then
        debug_log("BRANCH", "ascii_mode -> return 2")
        return 2
    end

    -- ========================================
    -- .
    -- ========================================

    if repr == '.' or repr == 'period' or repr == 'KP_Decimal' then

        debug_log("BRANCH", "period")

        if input == '' then
            debug_log("period", "empty input -> return 2")
            return 2
        end

        local restored = restore_original(input)

        debug_log(
            "period",
            "restore=" .. restored,
            "restore_hex=" .. bytes_to_hex(restored)
        )

        env.engine:commit_text(restored)
        ctx:clear()

        debug_log("period", "committed -> return 1")
        return 1
    end

    -- ========================================
    -- BackSpace
    -- ========================================

    if repr == 'BackSpace' then

        debug_log("BRANCH", "BackSpace")

        if input == '' then
            debug_log("BackSpace", "empty input -> return 2")
            return 2
        end

        local last_char =
            input:match('[%z\1-\127\194-\244][\128-\191]*$')

        if not last_char then
            debug_log("BackSpace", "no last_char -> return 2")
            return 2
        end

        debug_log(
            "BackSpace",
            "last_char=" .. last_char,
            "last_char_hex=" .. bytes_to_hex(last_char),
            "sym_set=" .. tostring(SYM_SET[last_char])
        )

        if not SYM_SET[last_char] then
            debug_log("BackSpace", "not special symbol -> return 2")
            return 2
        end

        replace_input(
            ctx,
            input:sub(1, #input - #last_char)
        )

        debug_log("BackSpace", "removed symbol -> return 1")
        return 1
    end

    -- ========================================
    -- . + Shift
    -- ========================================

    if input:sub(1, 1) == '.' then

        debug_log("BRANCH", "input starts with '.'")

        if shift then

            local sym = DOT_SHIFT_MAP[keycode]

            debug_log(
                "DOT_SHIFT",
                "keycode=" .. tostring(keycode),
                "mapped=" .. tostring(sym)
            )

            if sym then

                debug_log(
                    "DOT_SHIFT",
                    "commit=" .. sym,
                    "commit_hex=" .. bytes_to_hex(sym)
                )

                env.engine:commit_text(sym)
                ctx:clear()

                debug_log("DOT_SHIFT", "-> return 1")
                return 1
            end
        end

        debug_log("DOT_SHIFT", "not matched -> return 2")
        return 2
    end

    -- ========================================
    -- Shift
    -- ========================================

    if shift then

        debug_log(
            "BRANCH",
            "SHIFT",
            "repr=" .. tostring(repr),
            "keycode=" .. tostring(keycode)
        )

        local sym = SHIFT_MAP[keycode]

        debug_log(
            "SHIFT_MAP",
            "keycode=" .. tostring(keycode),
            "result=" .. tostring(sym)
        )

        if not sym then

            debug_log(
                "SHIFT_MAP",
                "NO MATCH",
                "available keycodes = 33,64,35,40,41",
                "actual=" .. tostring(keycode),
                "repr=" .. tostring(repr)
            )

            debug_log("SHIFT", "-> return 2")

            return 2
        end

        if input ~= '' then
            debug_log(
                "SHIFT",
                "input not empty, commit first candidate",
                "input=" .. input
            )

            commit_first_candidate(ctx, env)
        end

        debug_log(
            "SHIFT",
            "commit=" .. sym,
            "commit_hex=" .. bytes_to_hex(sym)
        )

        env.engine:commit_text(sym)

        debug_log("SHIFT", "-> return 1")

        return 1
    end

    -- ========================================
    -- 普通特殊符号
    -- ========================================

    local sym = TONE_MAP[repr]

    debug_log(
        "TONE_MAP",
        "repr=" .. tostring(repr),
        "result=" .. tostring(sym)
    )

    if not sym then

        debug_log(
            "TONE_MAP",
            "NO MATCH -> return 2"
        )

        return 2
    end

    local new_input = input .. sym

    debug_log(
        "TONE_MAP",
        "replace input",
        "old=" .. input,
        "new=" .. new_input,
        "new_hex=" .. bytes_to_hex(new_input)
    )

    replace_input(ctx, new_input)

    debug_log("TONE_MAP", "-> return 1")

    return 1
end

debug_log("========== PININ LUA LOADED ==========")
debug_log("DEBUG_FILE", DEBUG_FILE)

return M
