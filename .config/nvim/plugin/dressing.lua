local ok, dressing = pcall(require, "dressing")
if not ok then
	return
end

dressing.setup({
	input = {
		enabled = true,
	},
	select = {
		enabled = true,
	},
})
