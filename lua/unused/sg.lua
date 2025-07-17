local Plugin = { "sourcegraph/sg.nvim" }

-- Plugin.event = "VeryLazy"

function Plugin.config()
	require("sg").setup({})
end

return Plugin
