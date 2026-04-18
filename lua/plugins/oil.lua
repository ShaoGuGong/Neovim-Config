require("oil").setup({
    columns = {
        "permissions",
        "size",
        "mtime",
        "icon",
    },
})

vim.keymap.set("n", "<leader>.", "<CMD>Oil<CR>", { desc = "Open Oil" })
