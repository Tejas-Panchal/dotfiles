local ok, cmp_caps = pcall(require, "cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()

if ok then
	capabilities = vim.tbl_deep_extend("force", capabilities, cmp_caps.default_capabilities())
end
vim.lsp.config["*"] = vim.tbl_deep_extend("force", vim.lsp.config["*"] or {}, {
	capabilities = capabilities,
})

vim.lsp.enable({ "lua_ls", "gopls", "clangd", "jdtls", "pyright", "vimls", "marksman", "kotlin_language_server" })
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.INFO] = "I",
			[vim.diagnostic.severity.HINT] = "H",
		},
	},
	virtual_text = true,
	update_in_insert = false,
})
