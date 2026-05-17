vim.o.guicursor = ""
vim.o.showmode = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.wrap = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.swapfile = false
vim.o.clipboard = "unnamedplus"

-- session & fold
vim.o.sessionoptions = "buffers,winsize,curdir,folds,tabpages,winpos,help,globals,resize"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99

function _G.git_branch()
	local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
	local branch = handle and handle:read("*l") or ""
	if handle then
		handle:close()
	end
	if branch == "" then
		return ""
	end
	return "  " .. branch .. " "
end
vim.o.statusline = "%f %#StatusLineNC#%{%v:lua.git_branch()%}%= %l:%c "

vim.cmd.packadd("nvim.undotree")
