return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"letieu/harpoon-lualine",
	},
	branch = "harpoon2",
	-- lazy = false,
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		local toggle_opts = {
			border = "rounded",
			title_pos = "center",
			ui_width_ratio = 0.40,
		}

		vim.keymap.set("n", "<A-d>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts) end)
		vim.keymap.set("n", "<A-e>", function() harpoon:list():add() end)

		vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)

		harpoon:extend({
			UI_CREATE = function(cx)
				-- l is better then <CR>
				vim.keymap.set("n", "l", function()
								   harpoon.ui:select_menu_item()
							   end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-v>", function()
								   harpoon.ui:select_menu_item({ vsplit = true })
							   end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-x>", function()
								   harpoon.ui:select_menu_item({ split = true })
							   end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-t>", function()
								   harpoon.ui:select_menu_item({ tabedit = true })
							   end, { buffer = cx.bufnr })
			end,
		})
	end,
}
