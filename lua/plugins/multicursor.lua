local P = { name = "multicursor.nvim" }

vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		PackUtils.load(P, function()
			local mc = require("multicursor-nvim")
			mc.setup()

			local set = vim.keymap.set
			local wk = require("which-key")

			set({ "n", "x" }, "<c-q>", mc.toggleCursor)
			-- Add or skip adding a new cursor by matching word/selection
			wk.add({
				{
					"<leader>m",
					group = "Multicursor",
					icon = "󰗧",
				},
				{
					"<leader>mk",
					function()
						mc.lineAddCursor(-1)
					end,
					mode = { "n", "x" },
					desc = "Add cursor to previous line",
				},
				{
					"<leader>mj",
					function()
						mc.lineAddCursor(1)
					end,
					mode = { "n", "x" },
					desc = "Add cursor to next line",
				},
				{
					"<leader>mK",
					function()
						mc.lineSkipCursor(-1)
					end,
					mode = { "n", "x" },
					desc = "Skip cursor to previous line",
				},
				{
					"<leader>mJ",
					function()
						mc.lineSkipCursor(1)
					end,
					mode = { "n", "x" },
					desc = "Skip cursor to next line",
				},
				{
					"<leader>mn",
					function()
						mc.matchAddCursor(1)
					end,
					mode = { "n", "x" },
					desc = "Add cursor to next match",
				},
				{
					"<leader>ms",
					function()
						mc.matchSkipCursor(1)
					end,
					mode = { "n", "x" },
					desc = "Skip next match",
				},
				{
					"<leader>mN",
					function()
						mc.matchAddCursor(-1)
					end,
					mode = { "n", "x" },
					desc = "Add cursor to previous match",
				},
				{
					"<leader>mS",
					function()
						mc.matchSkipCursor(-1)
					end,
					mode = { "n", "x" },
					desc = "Skip previous match",
				},
			})

			-- Mappings defined in a keymap layer only apply when there are
			-- multiple cursors. This lets you have overlapping mappings.
			mc.addKeymapLayer(function(layerSet)
				-- Select a different cursor as the main one.
				layerSet({ "n", "x" }, "<left>", mc.prevCursor)
				layerSet({ "n", "x" }, "<right>", mc.nextCursor)

				-- Delete the main cursor.
				layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

				-- Enable and clear cursors using escape.
				layerSet("n", "<esc>", function()
					if not mc.cursorsEnabled() then
						mc.enableCursors()
					else
						mc.clearCursors()
					end
				end)
			end)

			-- Customize how cursors look.
			local hl = vim.api.nvim_set_hl
			hl(0, "MultiCursorCursor", { reverse = true })
			hl(0, "MultiCursorVisual", { link = "Visual" })
			hl(0, "MultiCursorSign", { link = "SignColumn" })
			hl(0, "MultiCursorMatchPreview", { link = "Search" })
			hl(0, "MultiCursorDisabledCursor", { reverse = true })
			hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
			hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
		end)
	end,
})
