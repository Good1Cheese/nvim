return {
	{
		"lambdalisue/suda.vim",
		cmd = { "SudaRead", "SudaWrite" },
	},
	{
		-- Detect tabstop and shiftwidth automatically
		'tpope/vim-sleuth',
	},
	{
		"gbprod/cutlass.nvim",
		lazy = false,
		config = function()
			require("cutlass").setup({
				cut_key = "X",
			})
		end
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end,
	},
}
