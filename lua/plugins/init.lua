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
}

return Plugins
