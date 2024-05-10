return {
	"echasnovski/mini.files",
	version = false,
	event = "VeryLazy",
	config = function()
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
