local P = { name = "tiny-inline-diagnostic.nvim" }

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		PackUtils.load(P, function()
			require("tiny-inline-diagnostic").setup({
				preset = "ghost",
				options = {
					multilines = {
						enabled = true,
						always_show = true,
					},
					show_all_diags_on_cursorline = true,
					throttle = 100,
				},
			})

			vim.diagnostic.config({ virtual_text = false })
		end)
	end,
})
