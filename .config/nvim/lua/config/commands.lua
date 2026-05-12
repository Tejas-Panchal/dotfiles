local dirs = {
  nvim    = "~/.config/nvim",
  hypr    = "~/.config/hypr",
  waybar  = "~/.config/waybar",
  omarchy = "~/.config/omarchy",
  home    = "~",
}

vim.api.nvim_create_user_command("Open", function(opts)
  require("oil").open(vim.fn.expand(dirs[opts.args]))
end, { nargs = 1, complete = function() return vim.tbl_keys(dirs) end })
