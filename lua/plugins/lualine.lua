vim.g.nvim_start_time = vim.loop.hrtime() / 1e6

require("lualine").setup({
	options = {
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
		lualine_b = {
			{
				"filename",
				separator = { right = "" },
				file_status = true, -- Displays file status (readonly status, modified status)
				newfile_status = true, -- Display new file status (new file means no write after created)
				path = 1, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory
				-- 4: Filename and parent dir, with tilde as the home directory

				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				-- It can also be a function that returns
				-- the value of `shorting_target` dynamically.
				symbols = {
					modified = "[]", -- Text to show when the file is modified.
					readonly = "[]", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "[]", -- Text to show for unnamed buffers.
					newfile = "[󰎔]", -- Text to show for newly created file before first write
				},
			},
		},
		lualine_c = { { "branch", icon = "" } },
		lualine_x = {
			"encoding",
			{
				-- 第一部分：定義圖示
				function()
					return "" -- 這裡放你喜歡的 Copilot 圖示
				end,
				-- 第二部分：定義顏色 (依據狀態)
				color = function()
					local status = package.loaded["copilot"] and require("copilot.status").data.status
					if status == "InProgress" then
						return { fg = "#ECBE7B" }
					end -- 進行中：黃色
					if status == "Warning" then
						return { fg = "#FF5189" }
					end -- 錯誤：紅色
					return { fg = "#98be65" } -- 正常：綠色
				end,
				-- 第三部分：檢查是否顯示 (只在 Copilot 啟動時顯示)
				cond = function()
					if not package.loaded["copilot"] then
						return false
					end
					local clients = vim.lsp.get_clients({ name = "copilot", bufnr = 0 })
					return #clients > 0
				end,
			},
		},
		lualine_y = {
			{ "progress", separator = { left = "" }, padding = { left = 1, right = 0 } },
			{ "location", padding = { left = 1, right = 1 } },
		},
		lualine_z = {
			{
				-- function()
				--     return " " .. os.date("%R")
				-- end,
				function()
					local now = vim.loop.hrtime() / 1e6
					local elapsed = now - vim.g.nvim_start_time
					local seconds = math.floor(elapsed / 1000)
					local minutes = math.floor(seconds / 60)
					if minutes >= 60 then
						local hours = math.floor(minutes / 60)
						minutes = minutes % 60
						return string.format("󰔟 %02d:%02d", hours, minutes)
					else
						seconds = seconds % 60
						return string.format("󰔟 %02d:%02d", minutes, seconds)
					end
				end,
				separator = { right = "" },
				left_padding = 2,
			},
		},
	},
})
