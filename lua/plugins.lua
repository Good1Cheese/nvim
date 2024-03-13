return {
	---------------------
	-- VISUTAL PLUGINS --
	---------------------

	-- Highlight under cursor
	require("plugins.vim-illuminate"),

	-- Buatiful indents
	-- *** IMPORTANT: this plugins do differents things,
	-- one is for CURRENT level scope, another is for ALL indents highlight
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },
	{ "echasnovski/mini.indentscope" },

	-- Icons
	{ "nvim-tree/nvim-web-devicons" },

	-- Dashboard
	{
		"MeanderingProgrammer/dashboard.nvim",
		event = "VimEnter",
	},

	{
		"ayu-theme/ayu-vim",
		config = function()
			vim.cmd([[
                let ayucolor="dark"
            ]])
		end,
	},

	-- {
	-- 	"mg979/vim-visual-multi",
	-- },

	--
	-- Treesitter hepler
	{
		"m-demare/hlargs.nvim",
		config = true,
	},

	-- Treesitter (Parser)
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		-- event = "VeryLazy",
	},

	-------------------------
	---- EDITING PLUGINS ----
	-------------------------

	-- Undotree
	{ "mbbill/undotree" },
	-- For quick commentting
	{ "numToStr/Comment.nvim" },
	-- Fix for Russian Layout
	{ "powerman/vim-plugin-ruscmd" },

	-- Delete without coping
	{
		"gbprod/cutlass.nvim",
		config = true,
	},

	-- Auto-Pairs
	{
		"windwp/nvim-autopairs",
		config = true,
	},

	-- Moving things across lines
	{
		"fedepujol/move.nvim",
        lazy = false,
		config = true
	},

	-- -- Quick quotes, brackets, etc
	-- {
	--     "kylechui/nvim-surround",
	--     version = "*",
	--     config = true,
	--     event = "VeryLazy",
	-- },

	-- -- Refactoring tool
	-- {
	--     "ThePrimeagen/refactoring.nvim",
	--     config = function()
	--         require("refactoring").setup()
	--     end,
	-- },

	-- {
	--     "nvim-neorg/neorg",
	--     build = ":Neorg sync-parsers",
	--     lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
	--     -- tag = "*",
	-- },

	-- For Notes
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	build = ":Neorg sync-parsers",
	-- 	cmd = "Neorg",
	-- },

	----------------------
	---- CORE PLUGINS ----
	----------------------


    -- Plugin for code cool runner
	{ "CRAG666/code_runner.nvim" },

	-- Awesome terminal
	{ "akinsho/toggleterm.nvim" },

	-- Sessions manager
	{
		"folke/persistence.nvim",
		config = true
	},

	--  Neovim lua API Support
	{
		"folke/neodev.nvim",
		config = true
	},

	-- Previewing changes
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},

	-- Tool for async Lua
	{ "nvim-lua/plenary.nvim" },

	-- File Explorer
	{ "nvim-neo-tree/neo-tree.nvim" },

	-- BufferLine
	{ "romgrk/barbar.nvim", lazy = false },

	-- Fuzzy Finder
	{ "nvim-telescope/telescope.nvim" },

	-- Gui library for plugins
	{
		"ray-x/guihua.lua",
		build = "cd lua/fzy && make",
	},

	-- Which-key
	{ "folke/which-key.nvim" },

	-- Debugger
	{ "rcarriga/nvim-dap-ui" },
    { "mfussenegger/nvim-dap" },
	{ "theHamsta/nvim-dap-virtual-text" },

	-- Code formatting
	{ "stevearc/conform.nvim" },

	-- Language Support
	{
		"VonHeikemen/lsp-zero.nvim",
		version = false,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim", config = true }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	},

	-- Noice
	{
		"folke/noice.nvim",
		config = true,
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	},
}
