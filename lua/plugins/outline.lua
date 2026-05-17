local P = { name = "outline.nvim" }

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		PackUtils.load(P, function()
			require("outline").setup()
			local wk = require("which-key")
			wk.add({
				{ "<leader>co", "<CMD>Outline<CR>", desc = "Toggle Outline" },
			})
		end)
	end,
})
