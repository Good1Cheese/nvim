local Plugin = { "ayu-theme/ayu-vim" }

Plugin.dependencies = {
	-- { "olimorris/onedarkpro.nvim" },
	-- { "nyoom-engineering/oxocarbon.nvim" },
	-- { "samharju/synthweave.nvim" },
	{ "scottmckendry/cyberdream.nvim" },
}

Plugin.priority = 1000
Plugin.lazy = false

function Plugin.config()
	vim.cmd([[ let ayucolor="dark" ]])
	vim.opt.background = "dark" -- set this to dark or light

	-- vim.cmd.colorscheme("oxocarbon")
	vim.cmd.colorscheme("ayu")
	-- vim.cmd.colorscheme("synthweave")
	-- vim.cmd.colorscheme("synthweave-transparent")

	-- require("cyberdream").setup({
	-- 	-- Recommended - see "Configuring" below for more config options
	-- 	transparent = true,
	-- 	italic_comments = true,
	-- 	hide_fillchars = true,
	-- 	borderless_telescope = false,
	-- 	terminal_colors = false,
	-- })
	--
	-- vim.cmd("colorscheme cyberdream") -- set the colorscheme
end

return Plugin
