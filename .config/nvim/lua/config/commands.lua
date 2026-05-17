local dirs = {
	nvim = "~/.config/nvim",
	hypr = "~/.config/hypr",
	zsh = "~/.config/zsh",
	tmux = {
		"~/.config/tmux/tmux.conf",
		"~/.config/tmux-sessionizer",
		"~/Scripts/bin/tmux",
		"~/Scripts/bin/tmux-sessionizer",
	},
	waybar = "~/.config/waybar",
	omarchy = "~/.config/omarchy",
	home = "~",
}

vim.api.nvim_create_user_command("Open", function(opts)
	local target = dirs[opts.args]
	local telescope = require("telescope.builtin")
	if type(target) == "table" then
		local search_dirs = vim.tbl_map(function(d)
			return vim.fn.expand(d)
		end, target)
		telescope.find_files({ search_dirs = search_dirs })
	else
		telescope.find_files({ cwd = vim.fn.expand(target) })
	end
end, {
	nargs = 1,
	complete = function()
		return vim.tbl_keys(dirs)
	end,
	desc = "Open config directories",
})

vim.api.nvim_create_user_command("Notes", function()
	require("oil").open(vim.fn.expand("~/Documents/Notes"))
end, {
	desc = "open Notes directory",
})

vim.api.nvim_create_user_command("Rename", function(opts)
	local old = vim.fn.expand("%:p")
	local new = vim.fn.fnamemodify(opts.args, ":p")
	if old == "" then
		vim.notify("No file to rename", vim.log.levels.ERROR)
		return
	end
	vim.fn.rename(old, new)
	vim.cmd("edit " .. vim.fn.fnameescape(new))
	vim.cmd("bdelete! " .. vim.fn.fnameescape(old))
end, {
	nargs = 1,
	complete = "file",
	desc = "Rename current file",
})
