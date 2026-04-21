require("tv").setup()

local wk = require("which-key")
wk.add({
	{
		"<leader>tv",
		desc = "TV: Select channel",
		icon = "",
		noremap = true,
		silent = true,
	},
})
