return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		local toggle_opts = {
			border = "rounded",
			title_pos = "center",
			ui_width_ratio = 0.40,
		}

		-- vim.api.nvim_buf_set_keymap(
		-- 	Harpoon_cmd_bufh,
		-- 	"n",
		-- 	"<CR>",
		-- 	"<Cmd>lua require('harpoon.cmd-ui').select_menu_item()<CR>",
		-- 	{}
		-- )

		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts) end)
		-- vim.keymap.set("n", "<Space-Tab>", function() harpoon:list():add() end)

		-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
		-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
		-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
		-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<Tab>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<S-Tab>", function() harpoon:list():next() end)
	end,
}
