require("oil").setup({
	columns = {
		"permissions",
		"size",
		"mtime",
		"icon",
	},
})

local wk = require("which-key")
wk.add({
	{
		"<leader>.",
		"<CMD>Oil<CR>",
		desc = "Open Oil",
		icon = "",
		noremap = true,
		silent = true,
	},
})
