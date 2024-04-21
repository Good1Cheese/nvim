local Plugin = {
	{ "ayu-theme/ayu-vim" },
	{ "olimorris/onedarkpro.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
}

function Plugin.config()
	vim.cmd([[ let ayucolor="dark" ]])
    vim.opt.background = "dark" -- set this to dark or light
end

return Plugin
