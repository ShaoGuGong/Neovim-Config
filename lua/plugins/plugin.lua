local plugins = {
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/stevearc/oil.nvim",
	-- set watatime
	"https://github.com/wakatime/vim-wakatime",

	-- set whick-key
	"https://github.com/folke/which-key.nvim",

	-- blinkcmp.lua 自动补全、代码片段
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
	-- lspconfig.lua
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	-- conform.lua 格式化工具formatter
	"https://github.com/stevearc/conform.nvim",
	-- treesitter.lua 需要安装tree-sitter-cli工具包
	"https://github.com/windwp/nvim-autopairs",
	-- set gitsigns
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/alexpasmantier/tv.nvim",
	-- set noice
	"https://github.com/folke/noice.nvim",
	"https://github.com/MunifTanjim/nui.nvim",

	"https://github.com/folke/flash.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",

	"https://github.com/HiPhish/rainbow-delimiters.nvim",

	"https://github.com/hedyhli/outline.nvim",

	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",

	"https://github.com/andweeb/presence.nvim",

	"https://github.com/karb94/neoscroll.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",

	{ src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("^9") },

	"https://github.com/zbirenbaum/copilot.lua",
}

vim.pack.add(plugins)

require("plugins.copilot")
require("plugins.lualine")
require("plugins.oil")
require("plugins.lspconfig")
require("plugins.conform")
require("plugins.autopairs")
require("plugins.tv")
require("plugins.noice")
require("plugins.outline")
require("plugins.flash")
require("plugins.inline-diagnostic")
require("plugins.presence")
require("plugins.neoscroll")
require("plugins.blink")
