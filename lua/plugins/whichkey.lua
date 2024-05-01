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

	which_key.OPTS = opts

	local Terminal = require("toggleterm.terminal").Terminal
	local fish = Terminal:new({ cmd = "fish", hidden = true })

	local lf = Terminal:new({
		cmd = "lf",
		-- close_on_exit = true,
		direction = "float",
		float_opts = {
			border = "double",
		},
	})

	function toggleFish()
		fish:toggle()
	end
	function toggleLF()
		lf:toggle()
	end

	local mappings = {
		["<cr>"] = { ":.!bash<cr>", "Execute in bash" },
		["p"] = { ":Lazy<cr>", "Plugin Manager" },
		["q"] = { ":qall!<cr>", "Quit" },
		-- ["1"] = { ":lua toggleTransparency()<cr>", "Toggle transparency" },
		-- ["a"]  = { ":q<cr>", "Close window" },
		["k"] = { [[:lua require("barbecue.ui").navigate(-2)<cr>]], "Go up" },
		["0"] = { ":LoadSession<cr>", "Load sessions" },
		["t"] = { ":lua toggleFish()<cr>", "Terminal" },
		-- ["l"] = { ":lua toggleLF()<cr>", "LF" },
		["e"] = { ":Neotree toggle right<cr>", "Explorer" },
		["a"] = { ":Outline<cr>", "Code outlaw" },
		["l"] = { [[:lua require("actions-preview").code_actions()<cr>]], "Code actions" },
		["L"] = { [[:LazyGit<cr>]], "Lazy Git" },
		["m"] = { ":Mason<cr>", "Mason UI for Lsp" },
		["u"] = { ":UndotreeToggle<cr>", "Undotree" },
		['"'] = { ":%s/'/\"/g", "Replace all quotes" },
		["!"] = { ":w<cr>:ReloadNIX<cr>", "Reload nix" },
		["1"] = { ":SudaWrite<cr>", "Sudo save" },
		["c"] = { ":RunFile<cr>", "RunFile" },

		-- r = {
		--     name = "Refactoring",
		--     e = { ":Refactor extract_block" }
		-- },
		-- s = {
		-- 	name = "Telescope",
		-- 	c = { ":Telescope colorscheme<cr>", "Colorschemes" },
		-- },

		["s"] = { ":Telescope live_grep <cr>", "Find Text" },
		["f"] = { ":lua require('telescope.builtin').find_files()<cr>", "Find files" },

		d = {
			name = "Debug",
			d = { ":DapUIToggle", "Toggle" },
			s = { ":DapUIReset", "Reset windows" },
			a = { ":DapContinue<cr>", "Continue" },
			f = { ":DapTerminate<cr>", "Terminate" },
			h = { ":DapToggleBreakpoint<cr>", "BreakPoint" },
			l = { ":DapStepOver<cr>", "Step over" },
			k = { ":DapStepInto<cr>", "Step into" },
			j = { ":DapStepOut<cr>", "Step out" },
		},

		h = {
			name = "GitSigns",
			s = { ":DapUIToggle", "Toggle" },
		},

		-- LSP
		n = {
			name = "LSP",
			a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			i = { ":LspInfo<cr>", "Info" },
			l = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = {
				":Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
		},
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
	}

	which_key.setup(setup)
	which_key.register(mappings, which_key.OPTS)
end

return Plugin
