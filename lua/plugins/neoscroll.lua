local P = { name = "neoscroll.nvim" }

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		PackUtils.load(P, function()
			require("neoscroll").setup()
		end)
	end,
})
