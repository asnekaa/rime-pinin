local MARK = "～"

local function rewrite_pinyin(pinyin)
    pinyin = pinyin:gsub("ie", "iê")
    pinyin = pinyin:gsub("ye", "yê")
    return pinyin
end

local function filter(input)
    for cand in input:iter() do
        local preedit = cand.preedit or ""

        -- 只有 custom_phrase_marker.lua 标记过的候选才处理
        if preedit:sub(-#MARK) == MARK then
            local pinyin = preedit:sub(1, -#MARK - 1)
            cand.preedit = rewrite_pinyin(pinyin) .. MARK
        end

        yield(cand)
    end
end

return {
    func = filter,
}
