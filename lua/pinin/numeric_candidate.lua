local M = {}

function M.func(input, seg, _)
	if not input:match("^%d+$") then
		return
	end

	yield(Candidate("", seg.start, seg._end, input, ""))
end

return M
