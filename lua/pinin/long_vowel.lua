local kagiroi = require("kagiroi/kagiroi")

local Top = {}

local VOWEL_GROUPS = {
    a = "あかさたなはまやらわがざだばぱゃゎ",
    i = "いきしちにひみりぎじぢびぴゐ",
    u = "うくすつぬふむゆるぐずづぶぷゅゔ",
    e = "えけせてねへめれげぜでべぺゑ",
    o = "おこそとのほもよろをごぞどぼぽょを",
}

local KANA_VOWEL = {}

for vowel, kana_list in pairs(VOWEL_GROUPS) do
    for _, code in utf8.codes(kana_list) do
        KANA_VOWEL[utf8.char(code)] = vowel
    end
end

local VOWEL_KANA = {
    ["あ"] = "a",
    ["い"] = "i",
    ["う"] = "u",
    ["え"] = "e",
    ["お"] = "o",
}

local function split_chars(s)
    local chars = {}
    for _, code in utf8.codes(s) do
        chars[#chars + 1] = utf8.char(code)
    end
    return chars
end

local function to_katakana(s)
    local chars = {}
    for _, code in utf8.codes(s) do
        if code >= 0x3041 and code <= 0x3096 then
            code = code + 0x60
        end
        chars[#chars + 1] = utf8.char(code)
    end
    return table.concat(chars)
end

local function collapse_vowels(s)
    local chars = split_chars(s)
    local out = {}
    local changed = false
    local index = 1

    while index <= #chars do
        local current = chars[index]
        local following = chars[index + 1]
        local following_vowel = VOWEL_KANA[following]

        if following
            and following_vowel
            and KANA_VOWEL[current] == following_vowel then
            out[#out + 1] = current
            out[#out + 1] = "ー"
            changed = true
            index = index + 2
        else
            out[#out + 1] = current
            index = index + 1
        end
    end

    return table.concat(out), changed
end

function Top.init(env)
    env.xlator = kagiroi.Thunk(function()
        return Component.Translator(env.engine, Schema("kagiroi"), "translator", "script_translator")
    end)
end

function Top.func(input, seg, env)
    if not seg:has_tag("kagiroi") then
        return
    end

    local reading, changed = collapse_vowels(input)

    if not changed then
        return
    end

    local katakana = to_katakana(reading)
    local ok, xlation = pcall(function()
        return env.xlator():query(reading, seg)
    end)

    if ok and xlation then
        local next_cand, iter = xlation:iter()
        while true do
            local cand = next_cand(iter)
            if not cand then
                break
            end
            if cand.text == katakana then
                yield(cand)
                return
            end
        end
    end

    yield(Candidate("kagiroi_pinin_long", seg.start, seg._end, katakana, ""))
end

return Top
