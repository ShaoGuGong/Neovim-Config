require("mason").setup()

require("mason-lspconfig").setup({
    ensure_install = { "lua_ls", "rust_analyzer" }
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)           -- gd跳转到定义
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)          -- gD跳转到声明(例如c语言中的头文件中的原型、一个变量的extern声明)
vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)      -- go跳转到变量类型定义的位置(例如一些自定义类型)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- <space>rn变量重命名
vim.keymap.set("n", "<leader>aw", vim.lsp.buf.code_action, opts)  -- <space>aw可以在出现警告或错误的地方打开建议的修复方法
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- <space>d浮动窗口显示所在行警告或错误信息
vim.keymap.set("n", "<leader>-", vim.diagnostic.goto_prev, opts)  -- <space>-跳转到上一处警告或错误的地方
vim.keymap.set("n", "<leader>=", vim.diagnostic.goto_next, opts)  -- <space>+跳转到下一处警告或错误的地方
vim.keymap.set("n", "<leader>cm", "<CMD>Mason<CR>", { desc = "Mason", noremap = true, silent = true })
