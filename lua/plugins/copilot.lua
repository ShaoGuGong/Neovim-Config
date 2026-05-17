local P = {
	name = "copilot.lua",
	deps = {
		"nvim-lua/plenary.nvim",
	},
}

local config_fn = function()
	require("copilot").setup({})

	vim.api.nvim_create_autocmd("User", {
		pattern = "BlinkCmpMenuOpen",
		callback = function()
			vim.b.copilot_suggestion_hidden = true
		end,
	})

	vim.api.nvim_create_autocmd("User", {
		pattern = "BlinkCmpMenuClose",
		callback = function()
			vim.b.copilot_suggestion_hidden = false
		end,
	})
end

vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		PackUtils.load(P, config_fn)
	end,
})
