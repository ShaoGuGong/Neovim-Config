require("mason").setup()

require("mason-lspconfig").setup({
	ensure_install = { "lua_ls", "rust_analyzer", "ruff" },
})

vim.lsp.config["pyright"] = {
	settings = {
		pyright = {
			disableDignostics = true,
		},
		python = {
			analysis = {
				typeCheckingMode = "off",
				-- reportPrivateImportUsage = "none",
				-- reportUnusedVariable = "none",
			},
		},
	},
}
