local telescope = require("telescope.builtin")

local wk = require("which-key")
wk.add({
	{
		"<leader>f",
		group = "Telescope",
		icon = "",
	},
	{
		"<leader>ff",
		telescope.find_files,
		desc = "Telescope find files",
		icon = "",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fg",
		telescope.live_grep,
		desc = "Telescope live grep",
		icon = "",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fb",
		telescope.buffers,
		desc = "Telescope buffers",
		icon = "",
		noremap = true,
		silent = true,
	},
	{
		"<leader>fh",
		telescope.help_tags,
		desc = "Telescope help tags",
		icon = "",
		noremap = true,
		silent = true,
	},
})
