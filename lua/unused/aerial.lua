local Plugin = { "stevearc/aerial.nvim" }

Plugin.cmd = { "AerialToggle" }

Plugin.opts = {
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	-- on_attach = function(bufnr)
	-- 	-- Jump forwards/backwards with '{' and '}'
	-- 	vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
	-- 	vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	-- end,

	-- Priority list of preferred backends for aerial.
	-- This can be a filetype map (see :help aerial-filetype-map)
	backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

	layout = {
		max_width = { 40, 0.2 },
		min_width = 15,
		default_direction = "prefer_left",
	},
}

return Plugin
