local Plugins = {
	{ "kyazdani42/nvim-web-devicons" },
	{ "mbbill/undotree" },
	{ "folke/persistence.nvim", config = true },
	{ "folke/neodev.nvim", config = true },

	-- Fix for Russian Layout
	{ "powerman/vim-plugin-ruscmd" },

	-- Tool for async Lua
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-neotest/nvim-nio" },

	-- Debugger
	{ "rcarriga/nvim-dap-ui" },
	{ "mfussenegger/nvim-dap" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "jay-babu/mason-nvim-dap.nvim" },

	-- Language Support
	{
		"VonHeikemen/lsp-zero.nvim",
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
}

return Plugins
