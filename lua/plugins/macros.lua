return {
	"ecthelionvi/NeoComposer.nvim",
	event = "VeryLazy",
	dependencies = { "kkharji/sqlite.lua" },
	config = function()
		vim.cmd("let g:sqlite_clib_path = '/home/cheese/dotfiles/.config/nvim/libsqlite3.so'")

		local config = {
			notify = true,
			delay_timer = 150,
			queue_most_recent = false,
			window = {
				width = 60,
				height = 10,
				border = "rounded",
				winhl = {
					Normal = "ComposerNormal",
				},
			},
			colors = {
				bg = "#16161e",
				fg = "#ff9e64",
				red = "#ec5f67",
				blue = "#5fb3b3",
				green = "#99c794",
			},
			keymaps = {
				play_macro = "Q",
				yank_macro = "yq",
				stop_macro = "cq",
				toggle_record = "q",
				cycle_next = "<c-n>",
				cycle_prev = "<c-p>",
				toggle_macro_menu = "<m-q>",
			},
		}

		require("NeoComposer").setup(config)
	end,
}