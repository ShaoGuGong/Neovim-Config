require("blink.cmp").setup({
	fuzzy = { -- 下载预编译的Fuzzy以节省空间
		prebuilt_binaries = {
			force_version = "v*",
		},
	},
	cmdline = {
		-- 默认的cmdline回车按下执行命令
		-- keymap = { ["<CR>"] = { "select_and_accept", "fallback" } },
		completion = {
			list = { selection = { preselect = false, auto_insert = true } },
			menu = {
				auto_show = function()
					return vim.fn.getcmdtype() == ":"
				end,
			},
			ghost_text = { enabled = false },
		},
	},
	keymap = {
		preset = "none",
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<CR>"] = { "accept", "fallback" },
		["<C-p>"] = { "select_prev", "snippet_backward", "fallback" },
		["<C-n>"] = { "select_next", "snippet_forward", "fallback" },
		["<Tab>"] = {
			function(cmp)
				-- 1. 優先處理 Copilot Suggestion (Ghost Text)
				local ok, copilot = pcall(require, "copilot.suggestion")
				if ok and copilot.is_visible() then
					-- 建立 Undo 斷點 (讓一次 undo 就能撤銷整個 AI 建議)
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-G>u", true, 0, true), "n", true)
					copilot.accept()
					return true -- 攔截按鍵，不執行後續動作
				end
				-- 2. 如果選單開著，就選下一個
				if cmp.is_visible() then
					return cmp.select_next()
				end
			end,
			"fallback", -- 3. 都不是的話，就執行原生的 Tab (縮排)
		},
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-e>"] = { "snippet_forward", "select_next", "fallback" },
		["<C-u>"] = { "snippet_backward", "select_prev", "fallback" },
	},
	completion = {
		keyword = { range = "full" },
		documentation = { auto_show = true, auto_show_delay_ms = 0 },
		list = { selection = { preselect = false, auto_insert = false } },
	},
	enabled = function()
		return not vim.tbl_contains({}, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
	end,
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "copilot", "lsp", "path", "snippets", "buffer" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
			},
			buffer = { score_offset = 5 },
			path = { score_offset = 3 },
			lsp = { score_offset = 2 },
			snippets = { score_offset = 1 },
			-- cmdline = { -- 输入超过3个及以上字母才触发补全
			-- 	min_keyword_length = function(ctx)
			-- 		if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then return 3 end
			-- 		return 0
			-- 	end,
			-- },
		},
	},
})
