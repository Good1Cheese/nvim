require("nvim-treesitter.configs").setup({
	ejnsure_installed = { "cpp", "python", "lua", "javascript", "norg" },
	sync_install = false,
	highlight = {
		enable = true,
		use_languagetree = true,
		indent = { enable = true },
		additional_vim_regex_highlighting = true,
	}
})
