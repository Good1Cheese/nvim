return {
	"Good1Cheese/nvim-springtime",
	branch = "shellbang-fix",
	lazy = true,
	cmd = { "Springtime", "SpringtimeUpdate" },
	dependencies = {
		"javiorfo/nvim-popcorn",
		"javiorfo/nvim-spinetta",
		"hrsh7th/nvim-cmp",
	},
	build = function()
		require("springtime.core").update()
	end,
	opts = {
		-- Some popup options
		dialog = {
			-- The keymap used to select radio buttons (normal mode)
			selection_keymap = "<C-Space>",

			-- The keymap used to generate the Spring project (normal mode)
			generate_keymap = "<C-CR>",

			-- If you want confirmation before generate the Spring project
			confirmation = true,

			-- Highlight links to Title and sections for changing colors
			style = {
				title_link = "Boolean",
				section_link = "Type",
			},
		},
	},
}
