local P = {
	name = "nvim-autopairs",
}

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		PackUtils.load(P, function()
			local Rule = require("nvim-autopairs.rule")
			local npairs = require("nvim-autopairs")
			npairs.setup({
				disable_filetype = { "Oil" },
			})

			npairs.add_rules({
				Rule("$$", "$$", "tex"),
				Rule("\\begin", "\\end", "tex"),
			})
		end)
	end,
})
