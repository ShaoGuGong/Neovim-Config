local P = {
	name = "compile-mode.nvim",
	deps = {
		"plenary.nvim",
	},
}

vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		PackUtils.load(P, function()
			require("which-key").add({
				{
					"<leader>cc",
					"<CMD>Compile<CR>",
					desc = "Compile command",
				},
			})
			vim.g.compile_mode = {
				input_word_completion = true,
				baleia_setup = true,
				bang_expansion = true,
				default_command = {
					python = "uv run main.py",
					rust = "cargo run",
					c = "make",
				},
			}
		end)
	end,
})
