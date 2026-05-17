vim.g.mapleader = " "
vim.g.localleader = "\\"

-- 向下加空行
vim.keymap.set("n", "<C-S-j>", "i<enter><ESC>", { noremap = true, silent = true })
