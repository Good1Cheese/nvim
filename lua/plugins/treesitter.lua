return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ejnsure_installed = { "lua" },
		sync_install = true,
		auto_install = true,
		highlight = {
			enable = true,
			use_languagetree = true,
			indent = {
				enable = true
			},
			additional_vim_regex_highlighting = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
	},
	config = function(name, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
