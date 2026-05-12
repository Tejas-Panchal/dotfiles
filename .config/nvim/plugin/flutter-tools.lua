local ok, flutter = pcall(require, "flutter-tools")
if not ok then
	return
end

flutter.setup({
	decorations = {
		statusline = {
			app_version = true,
			device = true,
			project_config = true,
		},
	},
})
