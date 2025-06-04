return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true },
		rename = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = {
			debounce = 0,     -- time in ms to wait before updating
			notify_jump = false, -- show a notification when jumping
			notify_end = true, -- show a notification when reaching the end
			foldopen = true,  -- open folds after jumping
			jumplist = true,  -- set jump point before jumping
			modes = { "n", "i", "c" }, -- modes to show references
			filter = function(buf) -- what buffers to enable `snacks.words`
				return vim.g.snacks_words ~= false and vim.b[buf].snacks_words ~= false
			end,
			enabled = true
		},
		styles = {
			notification = {
				wo = { wrap = true } -- Wrap notifications
			}
		}
	},
	keys = {
		-- Top Pickers & Explorer
		{ "<leader><space>", function() Snacks.picker.smart() end,              desc = "Smart Find Files" },
		{ "<leader>,",       function() Snacks.picker.buffers() end,            desc = "Buffers" },
		{ "<leader>/",       function() Snacks.picker.grep() end,               desc = "Grep" },
		{ "<leader>:",       function() Snacks.picker.command_history() end,    desc = "Command History" },
		{ "<leader>n",       function() Snacks.picker.notifications() end,      desc = "Notification History" },
		-- search
		{ "<leader>sd",      function() Snacks.picker.diagnostics() end,        desc = "Diagnostics" },
		{ "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
		{ "<leader>sC",      function() Snacks.picker.commands() end,           desc = "Commands" },
		{ "<leader>sj",      function() Snacks.picker.jumps() end,              desc = "Jumps" },
		{ "<leader>sk",      function() Snacks.picker.keymaps() end,            desc = "Keymaps" },
		{ "<leader>sM",      function() Snacks.picker.man() end,                desc = "Man Pages" },
		{ "<leader>sp",      function() Snacks.picker.lazy() end,               desc = "Search for Plugin Spec" },
		{ "<leader>u",       function() Snacks.picker.undo() end,               desc = "Undo History" },
		-- Other
		{ "<leader>9c",      function() Snacks.picker.colorschemes() end,       desc = "Colorschemes" },
		{ "<leader>r",       function() Snacks.rename.rename_file() end,        desc = "Rename File" },
		{ "<leader>L",       function() Snacks.lazygit() end,                   desc = "Lazygit" },
		-- { "<leader>un",      function() Snacks.notifier.hide() end,             desc = "Dismiss All Notifications" },
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		}
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "OilActionsPost",
			callback = function(event)
				if event.data.actions.type == "move" then
					Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
				end
			end,
		})
	end,
}
