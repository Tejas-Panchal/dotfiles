local ok, conform = pcall(require, "conform")
if not ok then
	return
end

conform.setup({
	formatters_by_ft = {
		lua      = { "stylua" },
		go       = { "goimports", "gofumpt" },
		dart     = { "dart_format" },
		flutter  = { "dart_format" },
		c        = { "clang-format" },
		cpp      = { "clang-format" },
		java     = { "clang-format" },
		kotlin   = { "ktlint" },
		python   = { "ruff_format" },
		json     = { "fixjson" },
		yaml     = { "yamlfmt" },
		toml     = { "taplo" },
		vim      = { "trim_whitespace" },
		markdown = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 3000,
		lsp_fallback = true,
	},
})
