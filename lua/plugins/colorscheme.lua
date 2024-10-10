local Plugin = { "Shatur/neovim-ayu" }

Plugin.dependencies = {
	-- { "olimorris/onedarkpro.nvim" },
	-- { "arturgoms/moonbow.nvim" },
	-- { "nyoom-engineering/oxocarbon.nvim" },
	-- { "samharju/synthweave.nvim" },
	{ "scottmckendry/cyberdream.nvim" },
	{ "javiorfo/nvim-nyctophilia" },
	-- { "rose-pine/neovim", name = "rose-pine" },
}

Plugin.priority = 1000
Plugin.lazy = false

function Plugin.config()
	-- vim.opt.background = "dark"
	-- vim.cmd.colorscheme("ayu")
	vim.cmd.colorscheme("tenebra")

	-- vim.cmd.colorscheme("oxocarbon")
	-- vim.cmd.colorscheme("rose-pine")
	-- vim.cmd.colorscheme("synthweave")
	-- vim.cmd.colorscheme("synthweave-transparent")
end

return Plugin
