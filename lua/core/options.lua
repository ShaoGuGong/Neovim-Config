vim.opt.guicursor = "a:block-blinkon500-blinkoff500-blinkwait500,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor,o:hor50"
vim.opt.winborder = "single"

vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.swapfile = false

vim.opt.textwidth = 120
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = "utf8"

vim.opt.list = true
vim.opt.lcs = {
    tab = "󰌒 ",
    space = "·",
    -- trail = " ",
    nbsp = "+",
}

vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
