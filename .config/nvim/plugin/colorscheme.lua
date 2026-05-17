local ok, aether = pcall(require, "aether")
if not ok then
	return
end

aether.setup({
	colors = {
		bg = "#0e0c0c",
		dark_bg = "#0b0909",
		darker_bg = "#070606",
		lighter_bg = "#262424",
		fg = "#ffffff",
		dark_fg = "#bfbfbf",
		light_fg = "#ffffff",
		bright_fg = "#ffffff",
		muted = "#938f85",
		red = "#fa5951",
		yellow = "#eefb50",
		orange = "#fb726b",
		green = "#77fb50",
		cyan = "#51fafa",
		blue = "#5185fa",
		purple = "#fa51f6",
		brown = "#974440",
		bright_red = "#b23b34",
		bright_yellow = "#b8c63c",
		bright_green = "#73cc4e",
		bright_cyan = "#4dcbcb",
		bright_blue = "#3454b1",
		bright_purple = "#b134ae",
		accent = "#b34ecb",
		cursor = "#ffffff",
		foreground = "#ffffff",
		background = "#0e0c0c",
		selection = "#262424",
		selection_foreground = "#ffffff",
		selection_background = "#262424",
	},
})

vim.cmd.colorscheme("aether")

-- fold
vim.api.nvim_set_hl(0, "Folded", { bg = "#b34ecb", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0e0c0c", fg = "#5185fa" })
