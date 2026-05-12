vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "y", '"+y', { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<ALT>j", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set({ "n", "v" }, "<ALT>k", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set({ "n" }, "L", ":bn<CR>", { desc = "next buffer" })
vim.keymap.set({ "n" }, "H", ":bp<CR>", { desc = "previous buffer" })

vim.keymap.set({ "n" }, "<leader>bd", ":bd<CR>", { desc = "delete buffer" })
vim.keymap.set({ "n" }, "<leader>bo", function()
	local buf = vim.api.nvim_get_current_buf()
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if b ~= buf and vim.api.nvim_buf_is_loaded(b) then
			vim.api.nvim_buf_delete(b, { force = false })
		end
	end
end, { desc = "delete all buffers except current" })

vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "line diagnostics" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "prev diagnostic" })

-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
