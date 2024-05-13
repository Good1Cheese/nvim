return {
	"Good1Cheese/harpoon",
	branch = "harpoon2",
	lazy = false,
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

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<Tab>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<S-Tab>", function() harpoon:list():next() end)
	end,
}
