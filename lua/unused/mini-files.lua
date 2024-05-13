return {
	"echasnovski/mini.files",
	version = false,
	-- event = "VeryLazy",
	config = function()
		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local new_target_window
				vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
					vim.cmd(direction .. " split")
					new_target_window = vim.api.nvim_get_current_win()
				end)

				MiniFiles.set_target_window(new_target_window)
			end

			-- Adding `desc` will result into `show_help` entries
			local desc = "Split " .. direction
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak keys to your liking
				map_split(buf_id, "<C-s>", "belowright horizontal")
				map_split(buf_id, "<C-v>", "belowright vertical")
			end,
		})

		-- vim.api.nvim_create_autocmd("User", {
		--	pattern = "MiniFilesWindowOpen",
		--	callback = function(args)
		--		local win_id = args.data.win_id
		--
		--		-- vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = "#1f2b36" })
		--		-- vim.api.nvim_set_hl(0, "MiniFilesBorderModified", { bg = "#1f2b36" })
		--
		--		-- Customize window-local settings
		--		-- vim.wo[win_id].winblend = 10
		--		-- vim.api.nvim_win_set_config(win_id)
		--	end,
		-- })

		require("mini.files").setup({
			-- General options
			options = {
				-- Whether to delete permanently or move into module-specific trash
				permanent_delete = false,
				-- Whether to use for editing directories
				use_as_default_explorer = false,
			},

			mappings = {
				go_in_plus = "l",
			},

			-- Customization of explorer windows
			windows = {
				-- Whether to show preview of file/directory under cursor
				preview = true,
				-- Width of focused window
				width_focus = 50,
				-- Width of non-focused window
				width_nofocus = 50,
				-- Width of preview window
				width_preview = 75,
			},
		})
	end,
}
