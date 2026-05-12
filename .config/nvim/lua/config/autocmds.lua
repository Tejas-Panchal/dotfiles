vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if
				vim.api.nvim_buf_is_valid(buf)
				and vim.bo[buf].buflisted
				and vim.fn.bufname(buf) == ""
				and vim.api.nvim_buf_line_count(buf) <= 1
				and #vim.api.nvim_buf_get_lines(buf, 0, -1, false) <= 1
				and not vim.bo[buf].modified
				and vim.fn.bufwinnr(buf) == -1
			then
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		end
	end,
})
