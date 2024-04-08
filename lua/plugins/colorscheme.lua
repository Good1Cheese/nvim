local Plugin = {
    { "ayu-theme/ayu-vim" },
    { "olimorris/onedarkpro.nvim" }
}

function Plugin.config()
	vim.cmd([[ let ayucolor="dark" ]])
end

return Plugin
