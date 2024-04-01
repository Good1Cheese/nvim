local statusOk, which_key = pcall(require, "which-key")
if not statusOk then
	return
end

local setup = {
	-- plugins = {
	-- 	marks = true, -- shows a list of your marks on ' and `
	-- 	presets = {
	-- 		operators = true, -- adds help for operators like d, y, ...
	-- 		motions = true, -- adds help for motions
	-- 		text_objects = true, -- help for text objects triggered after entering an operator
	-- 	},
	-- },
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},

	ignore_missing = true,
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local Terminal = require("toggleterm.terminal").Terminal
local fish = Terminal:new({ cmd = "fish", hidden = true })
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	close_on_exit = true,
	direction = "float",
	float_opts = {
		border = "double",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		vim.cmd("startinsert!")
	end,
})

function toggleFish()
	fish:toggle()
end
function toggleLazyGit()
	lazygit:toggle()
end

local transparency = false

function toggleTransparency()
	transparency = not transparency
	if transparency then
		vim.g.neovide_transparency = 1
		return
	end
	vim.g.neovide_transparency = 0.9
end

local mappings = {
	["p"] = { ":Lazy<cr>", "Plugin Manager" },
	["q"] = { ":qall!<cr>", "Quit" },
	["1"] = { ":lua toggleTransparency()<cr>", "Toggle transparency" },
	-- ["a"]  = { ":q<cr>", "Close window" },
	["0"] = { [[<cmd>lua require("persistence").load({ last = true })<cr>]], "Load sessions" },
	["t"] = { ":lua toggleFish()<cr>", "Terminal" },
	["l"] = { ":lua toggleLazyGit()<cr>", "Lazygit" },
	["e"] = { ":Neotree toggle right<cr>", "Explorer" },
	["a"] = { ":Dashboard<cr>", "Start menu" },
	-- ["g"]  = { ":Neogit<cr>", "Open git" },
	["m"] = { ":Mason<cr>", "Mason UI for Lsp" },
	["u"] = { ":UndotreeToggle<cr>", "Undotree" },
	['"'] = { ":%s/'/\"/g", "Replace all quotes" },
	["!"] = { ":w !sudo tee %<cr>", "Sudo save" },
	["c"] = { ":RunFile<cr>", "RunFile" },

	-- r = {
	--     name = "Refactoring",
	--     e = { ":Refactor extract_block" }
	-- },
	s = {
		name = "Telescope",
		d = { ":lua require('telescope.builtin').find_files()<cr>", "Find files" },
		a = { ":Telescope oldfiles<cr>", "Open Recent File" },
		s = { ":Telescope live_grep <cr>", "Find Text" },
		-- v = { ":Telescope diagnostics<cr>", "Diagnostics" },
		-- k = { ":Telescope keymaps<cr>", "Keymaps" },
		c = { ":Telescope colorscheme<cr>", "Colorschemes" },
	},

	d = {
		name = "Debug",
		d = { ":lua require('dapui').toggle()<cr>", "Toggle" },
		s = { ":lua require('dapui').open({ reset = true })<cr>", "Reset windows" },
		a = { ":DapContinue<cr>", "Continue" },
		f = { ":DapTerminate<cr>", "Terminate" },
		h = { ":DapToggleBreakpoint<cr>", "BreakPoint" },
		l = { ":DapStepOver<cr>", "Step over" },
		k = { ":DapStepInto<cr>", "Step into" },
		j = { ":DapStepOut<cr>", "Step out" },
	},

	-- c = {
	-- 	name = "Runner",
	-- x = { ":CompilerToggleResults<cr>", "..." },
	-- v = { ":CompilerRedo<cr>", "..." },
	-- },

	-- ["h"]  = { ":DapToggleBreakpoint<cr>", "BreakPoint" },
	-- ["l"]  = { ":DapStepOver<cr>", "Step over" },
	-- ["k"]  = { ":DapStepInto<cr>", "Step into" },
	-- ["j"]  = { ":DapStepOut<cr>", "Step out" },

	-- t = {
	--     name = "Terminal",
	--     f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, -- Floating Terminal
	--
	--     -- Play with size according to your needs.
	--     h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- Horizontal Terminal
	--     v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },     -- Vertical Terminal
	-- },

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
which_key.register(mappings, opts)
