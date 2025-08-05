local Plugin = { "folke/which-key.nvim" }

Plugin.lazy = false
-- Plugin.event = "VeryLazy"

Plugin.opts = {
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},

	ignore_missing = true,
}

function Plugin.config()
	local which_key = require("which-key")

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	which_key.setup(opts)
	-- which_key.OPTS = opts

	local t = require("toggleterm.terminal").Terminal
	local fish = t:new({ cmd = "fish", hidden = true })
	-- local upt = t:new({ cmd = "fish -c 'nflake'", hidden = false })
	local oil = require("oil")

	which_key.add({
		{ "<leader>s", ":Silicon<cr>", desc = "Make screenshot", mode = "v" },
		-- { "<leader>!", function() upt:toggle() end, desc = "Update", },

		{ "<leader>m", ":Mason<cr>", desc = "Mason", hidden = true},
		{ "<leader>p", ":Lazy<cr>", desc = "Lazy", hidden = true },
		{ "<leader>C", ":RunClose<cr>", desc = "Close tests", hidden = true },
		{ "<leader>e", oil.open, desc = "Explorer", hidden = true },
		-- { "<leader>u", ":lua require('undotree').toggle()<cr>", desc = "Undotree", hidden = true },

		{ "<leader>q", ":qall!<cr>", desc = "Quit" },
		{ "<leader>0", ":LoadSession<cr>", desc = "Session" },
		{ "<leader>t", function() fish:toggle() end, desc = "Terminal", },

		-- { "<leader>n", ":CdProject<cr>", desc = "Cd Project" },
		-- { "<leader>L", ":LazyGit<cr>", desc = "Lazy Git" },

		{ "<leader>a", ":Outline<cr>", desc = "Code outlaw" },
		{ "<leader>l", [[:lua require("actions-preview").code_actions()<cr>]], desc = "Code actions" },
		{ "<leader>c", ":w<CR>:RunFile<CR>", desc = "RunFile" },

		{ "<leader>E", ":lua MiniFiles.open()<cr>", desc = "Open miniFiles" },

		{ "<leader>s", ":Telescope live_grep<cr>", desc = "FindT" },
		{ "<leader>f", ":Telescope find_files<cr>", desc = "FindF" },
		{ "<leader>S", ":Telescope resume<cr>", desc = "Find prev" },

		-- { "<leader>r", group = "Refactoring" },
		-- { "<leader>re", ":Refactor extract_block" },

		-- { "<leader>I", ":UITest<cr>" },
		-- { "<leader>i", group = "Plugin" },
		-- { "<leader>ie", ":UpdateRemotePlugins<cr>" },
		-- { "<leader>ir", ":messages<cr>" },
		-- { "<leader>ig", ":FetchKata<cr>" },

		{ "<leader>9", group = "Stuff" },
		{ '<leader>9"', ":%s/'/\"/g", desc = "Replace all quotes" },

		-- { "<leader>9!", ":w<cr>:ReloadNIX<cr>", desc = "Reload nix" },
		-- { "<leader>9c", ":Telescope colorscheme(enable_preview=true)<cr>", desc = "Colorschemes" },
		-- { "<leader>9t", ":lua toggleTransparency()<cr>", desc = "Toggle transparency" },
		-- { "<leader>9r", ":RORCommands<cr>", desc = "Ruby on RAILS" },

		{ "<leader>9s", ":w !doas tee % >/dev/null<cr>", desc = "Sudo save" },
		{ "<leader>9<cr>", ":.!bash<cr>", desc = "Execute in bash" },

		-- d = {
		-- 	name = "Debug",
		-- 	{ "d", ":DapUIToggle", desc = "Toggle" },
		-- 	{ "s", ":DapUIReset", "Reset windows" },
		-- 	{ "a", ":DapContinue<cr>", "Continue" },
		-- 	{ "f", ":DapTerminate<cr>", "Terminate" },
		-- 	{ "h", ":DapToggleBreakpoint<cr>", "BreakPoint" },
		-- 	{ "l", ":DapStepOver<cr>", "Step over" },
		-- 	{ "k", ":DapStepInto<cr>", "Step into" },
		-- 	{ "j", ":DapStepOut<cr>", "Step out" },
		-- },
		--
		-- h = {
		-- 	name = "GitSigns",
		-- 	s = { ":DapUIToggle", "Toggle" },
		-- },

		-- -- LSP
		-- n = {
		-- 	name = "LSP",
		-- 	a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		-- 	i = { ":LspInfo<cr>", "Info" },
		-- 	l = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		-- 	s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
		-- 	S = {
		-- 		":Telescope lsp_dynamic_workspace_symbols<cr>",
		-- 		"Workspace Symbols",
		-- 	},
		-- },
		-- lsp.on_attach(function(client, bufnr)
		--     local opts = { buffer = bufnr, remap = false }
		--
		--     vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		--     vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		--     vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		--     vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
		--     vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		--     vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
		--     vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		--     vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		--     vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		--     vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		-- end)
		--
	})
end

return Plugin
