local P = {
	name = "conform.nvim",
	deps = {
		"mason.nvim",
	},
}

local formatters_by_ft = {
	lua = { "stylua" },
	python = { "ruff_format" },
	toml = { "taplo" },
	rust = { "rustfmt", lsp_format = "fallback" },
	c = { "clang-format", lsp_format = "fallback" },
	cpp = { "clang-format", lsp_format = "fallback" },
	tex = { "tex-fmt", lsp_format = "fallback" },
	typst = { "typstyle", lsp_format = "fallback" },
}

local config_fn = function()
	require("conform").setup({
		formatters_by_ft = formatters_by_ft,
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})
	--
	-- vim.api.nvim_create_autocmd("BufWritePre", {
	-- 	pattern = "*",
	-- 	callback = function(args)
	-- 		require("conform").format({ bufnr = args.buf })
	-- 	end,
	-- })
end

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		PackUtils.load(P, config_fn)
	end,
})
