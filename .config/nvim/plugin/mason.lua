local ok, mason = pcall(require, "mason")
if not ok then
	return
end

mason.setup()

local mlsp_ok, mlsp = pcall(require, "mason-lspconfig")
if mlsp_ok then
	mlsp.setup({
		ensure_installed = { "lua_ls", "gopls", "clangd", "jdtls", "pyright", "vimls", "marksman", "kotlin_language_server" },
		automatic_installation = true,
	})
end

local registry_ok = pcall(require, "mason-registry")
if registry_ok then
	local registry = require("mason-registry")
	for _, pkg in ipairs({ "stylua", "gofumpt", "clang-format", "ruff", "taplo", "yamlfmt", "prettier", "ktlint" }) do
		if not registry.is_installed(pkg) then
			registry.get_package(pkg):install()
		end
	end
end
