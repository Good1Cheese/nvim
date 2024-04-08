local Plugin = { "ayu-theme/ayu-vim" }

function Plugin.config()
	vim.cmd([[ let ayucolor="dark" ]])
end

return Plugin
