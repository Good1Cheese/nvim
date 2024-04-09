local Plugin = { "gbprod/cutlass.nvim" }

Plugin.lazy = false

function Plugin.config()
	require("cutlass").setup({
		cut_key = "X",
	})
end

return Plugin
