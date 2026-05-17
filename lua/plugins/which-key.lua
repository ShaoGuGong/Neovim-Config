local P = {
	name = "which-key.nvim",
}

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		PackUtils.load(P, function()
			local wk = require("which-key")

			wk.add({
				{
					"<leader>g",
					group = "Go to",
				},
				{
					"<leader>c",
					group = "Code",
					icon = "",
				},
				{
					"<leader>ca",
					vim.lsp.buf.code_action,
					desc = "Code Action",
					icon = "",
					noremap = true,
					silent = true,
				},
				{
					"<leader>w",
					group = "Window",
					icon = "󱂬",
				},
				{
					"<leader>ws",
					"<C-w>s",
					desc = "New window Horizontal",
				},
				{
					"<leader>wv",
					"<C-w>v",
					desc = "New window Vertical",
				},
				{
					"<leader>wq",
					"<C-w>q",
					desc = "Close current window",
				},
				{
					"<leader>wJ",
					"<C-w>J",
					desc = "Move window to down",
				},
				{
					"<leader>wK",
					"<C-w>K",
					desc = "Move window to up",
				},
				{
					"<leader>wH",
					"<C-w>H",
					desc = "Move window to left",
				},
				{
					"<leader>wL",
					"<C-w>L",
					desc = "Move window to right",
				},
				{
					"<leader>wh",
					"<C-w>h",
					desc = "Go to left window",
				},
				{
					"<leader>wj",
					"<C-w>j",
					desc = "Go to down window",
				},
				{
					"<leader>wk",
					"<C-w>k",
					desc = "Go to up window",
				},
				{
					"<leader>wl",
					"<C-w>l",
					desc = "Go to right window",
				},
				{
					"<C-l>",
					"<C-w>l",
				},
				{
					"<C-h>",
					"<C-w>h",
				},
				{
					"<C-j>",
					"<C-w>j",
				},
				{
					"<C-k>",
					"<C-w>k",
				},
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
				{
					"<leader>a",
					"<CMD>Copilot disable<CR>",
					desc = "Disable Copilot",
					icon = "",
					noremap = true,
					silent = true,
				},
				{
					"<leader>h",
					"<CMD>nohlsearch<CR>",
					desc = "Clear search highlight",
					icon = "󰸱",
					noremap = true,
					silent = true,
				},
			})
		end)
	end,
})
