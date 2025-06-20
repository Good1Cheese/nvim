return {
	"folke/which-key.nvim",
	lazy = false,
	opts = {
		window = {
			border = "rounded", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
			winblend = 0,
		},

		ignore_missing = true,
	},

	config = function()
		local which_key = require("which-key")

		local opts = {
			mode = "n", -- NORMAL mode
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		}

		which_key.setup(opts)
		-- which_key.OPTS = opts

		local t = require("toggleterm.terminal").Terminal
		local fish = t:new({ cmd = "fish", hidden = true })
		-- local upt = t:new({ cmd = "fish -c 'nflake'", hidden = false })
		local oil = require("oil")

		which_key.add({
			{ "<leader>s",     ":Silicon<cr>",                                         desc = "Make screenshot",   mode = "v" },

			{ "<leader>m",     ":Mason<cr>",                                           desc = "Mason",             hidden = true },
			{ "<leader>p",     ":Lazy<cr>",                                            desc = "Lazy",              hidden = true },
			{ "<leader>C",     ":RunClose<cr>",                                        desc = "Close tests",       hidden = true },
			{ "<leader>e",     oil.open,                                               desc = "Explorer",          hidden = true },

			{ "<leader>q",     ":qall!<cr>",                                           desc = "Quit" },
			{ "<leader>0",     ":LoadSession<cr>",                                     desc = "Session" },
			{ "<leader>t",     function() fish:toggle() end,                           desc = "Terminal", },

			{ "<leader>a",     ":Outline<cr>",                                         desc = "Code outlaw" },
			{ "<leader>l",     [[:lua require("actions-preview").code_actions()<cr>]], desc = "Code actions" },
			{ "<leader>c",     ":w<cr>:RunFile<cr>",                                   desc = "RunFile" },

			{ "<leader>E",     ":lua MiniFiles.open()<cr>",                            desc = "Open miniFiles" },

			{ "<leader>s",     ":Telescope live_grep<cr>",                             desc = "FindT" },
			{ "<leader>f",     ":Telescope find_files<cr>",                            desc = "FindF" },
			{ "<leader>S",     ":Telescope resume<cr>",                                desc = "Find prev" },

			{ "<leader>9",     group = "Stuff" },
			{ '<leader>9"',    ":%s/'/\"/g",                                           desc = "Replace all quotes" },

			{ "<leader>9s",    ":SudaWrite<cr>",                                       desc = "Sudo save" },
			{ "<leader>9<cr>", ":.!bash<cr>",                                          desc = "Execute in bash" },
		})
	end
}
