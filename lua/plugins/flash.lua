local P = { name = "flash.nvim" }

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		PackUtils.load(P, function()
			require("flash").setup()

			vim.keymap.set({ "n", "x", "o" }, "s", function()
				require("flash").jump()
			end, { desc = "Flash" })
			vim.keymap.set({ "n", "x", "o" }, "S", function()
				require("flash").treesitter()
			end, { desc = "Flash Treesitter" })
			vim.keymap.set({ "x", "o" }, "S", function()
				require("flash").treesitter()
			end, { desc = "Treesitter Search" })
		end)
	end,
})
