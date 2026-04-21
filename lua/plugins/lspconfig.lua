require("mason").setup()

require("mason-lspconfig").setup({
	ensure_install = { "lua_ls", "rust_analyzer" },
})

local wk = require("which-key")
wk.add({
	{
		"<leader>k",
		vim.lsp.buf.hover,
		desc = "LSP Hover",
		icon = "",
		noremap = true,
		silent = true,
	},
	{
		"gd",
		vim.lsp.buf.definition,
		desc = "Go to definition",
		icon = "",
		noremap = true,
		silent = true,
	},
	{
		"gD",
		vim.lsp.buf.declaration,
		desc = "Go to declaration",
		icon = "",
		noremap = true,
		silent = true,
	},
	{
		"go",
		vim.lsp.buf.type_definition,
		desc = "Go to type definition",
		icon = "",
		noremap = true,
		silent = true,
	},
	{
		"<leader>cr",
		vim.lsp.buf.rename,
		desc = "LSP Rename",
		icon = "",
		noremap = true,
		silent = true,
	},
	{
		"<leader>d",
		vim.diagnostic.open_float,
		desc = "Open diagnostics",
		icon = "",
		noremap = true,
		silent = true,
	},
	{
		"<leader>c-",
		vim.diagnostic.goto_prev,
		noremap = true,
		silent = true,
	},
	{
		"<leader>c=",
		vim.diagnostic.goto_next,
		noremap = true,
		silent = true,
	},
})
