-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set Fcitx5 autocmds auto switch input method to English
-- 建立一個 augroup，防止重複定義
local input_method_group = vim.api.nvim_create_augroup("Fcitx5Toggle", { clear = true })
local c_dev_group = vim.api.nvim_create_augroup("CDevSetting", { clear = true })
local lua_dev_group = vim.api.nvim_create_augroup("LuaDevSetting", { clear = true })
local compile_group = vim.api.nvim_create_augroup("CompileSetting", { clear = true })

-- 定義要綁定的事件
-- local input_method_events = {
--     "InsertEnter",
--     "InsertLeave",
--     "BufEnter",
--     "BufLeave",
--     "BufCreate",
-- }

-- 綁定每個事件
vim.api.nvim_create_autocmd("InsertLeave", {
	group = input_method_group,
	pattern = "*",
	callback = function()
		-- 1. 使用同步方式獲取當前輸入法 (因為代碼邏輯需要等待這個結果)
		-- 注意：這裡改用 ABC 或 US，取決於你 Mac 上顯示的名稱
		local target_im = "com.apple.keylayout.ABC"

		-- 執行一次獲取結果，清理空白字元
		local current_im = vim.fn.system("im-select"):gsub("%s+", "")

		-- 2. 判斷是否需要切換
		if current_im ~= target_im then
			-- 使用非同步 spawn 切換，這樣不會卡住編輯器 UI
			vim.uv.spawn("im-select", { args = { target_im } })
		end
	end,
})

local c_dev_events = {
	"BufRead",
	"BufNewFile",
}

vim.api.nvim_create_autocmd(c_dev_events, {
	group = c_dev_group,
	pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.tex", "*.typ" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

local lua_dev_events = {
	"BufRead",
	"BufNewFile",
}

vim.api.nvim_create_autocmd(lua_dev_events, {
	group = lua_dev_group,
	pattern = { "*.lua" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = false
	end,
})
