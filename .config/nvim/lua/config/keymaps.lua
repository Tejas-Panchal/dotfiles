vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- move selected line up ro down
vim.keymap.set({ "n", "v" }, "<A-j>", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set({ "n", "v" }, "<A-k>", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- jump to buffers
vim.keymap.set({ "n" }, "L", ":bn<CR>", { desc = "next buffer" })
vim.keymap.set({ "n" }, "H", function()
	if vim.bo.filetype == "oil" then
		require("oil").toggle_hidden()
		return
	end
	vim.cmd("bp")
end, { desc = "previous buffer" })

-- delete buffers
vim.keymap.set({ "n" }, "<leader>bd", ":bd<CR>", { desc = "delete buffer" })
vim.keymap.set({ "n" }, "<leader>bo", function()
	local buf = vim.api.nvim_get_current_buf()
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if b ~= buf and vim.api.nvim_buf_is_loaded(b) then
			vim.api.nvim_buf_delete(b, { force = false })
		end
	end
end, { desc = "delete all buffers except current" })

-- open diagnostics
vim.keymap.set("n", "gld", vim.diagnostic.open_float, { desc = "line diagnostics" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "prev diagnostic" })

-- open configs
vim.keymap.set("n", "<leader>fcn", ":Open nvim<CR>", { desc = "Open nvim config" })
vim.keymap.set("n", "<leader>fcz", ":Open zsh<CR>", { desc = "Open zsh config" })
vim.keymap.set("n", "<leader>fch", ":Open hypr<CR>", { desc = "Open hyprland config" })
vim.keymap.set("n", "<leader>fct", ":Open tmux<CR>", { desc = "Open tmux config" })

-- jump to references
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover documentation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "references" })

-- checkbox toggle
vim.keymap.set({ "n", "v" }, "<A-x>", "<CMD>CheckboxCycleNext<CR>", { desc = "Toggle checkbox" })

-- undotree
vim.keymap.set("n", "<leader>ut", "<CMD>Undotree<CR>", { desc = "Open Undotree" })
