local colorschemes = {
	{ src = "https://codeberg.org/evergarden/nvim.git", name = "evergarden" },
}

vim.pack.add(colorschemes)

require("plugins.evergarden")

vim.cmd("colorscheme evergarden")
