local Plugin = { "nvim-treesitter/nvim-treesitter" }
Plugin.event = { "BufReadPre", "BufNewFile" }
Plugin.branch = "main"

-- TSInstall lua c_sharp bash java xml csv json c cpp python dockerfile

function Plugin.config()
	require("nvim-treesitter").setup {
		-- Directory to install parsers and queries to
		install_dir = vim.fn.stdpath("data") .. "/site"
	}
end

return Plugin
