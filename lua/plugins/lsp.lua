local Plugin = { "neovim/nvim-lspconfig" }

function Plugin:lsps()
	self.lspcfg.bashls.setup({})
	self.lspcfg.asm_lsp.setup({})
	self.lspcfg.clangd.setup({})
	self.lspcfg.nil_ls.setup({})
	self.lspcfg.gdscript.setup({})
	self.lspcfg.pylsp.setup({})

	self:luals()
	self:solargraph()
end

function Plugin:solargraph()
	self.lspcfg.solargraph.setup({
		-- on_attach = M.on_attach,
		self.cap,
		filetypes = { "ruby", "eruby" },
		settings = {
			solargraph = {
				useBundler = true,
				diagnostic = true,
				completion = true,
				hover = true,
				formatting = true,
				symbols = true,
				definitions = true,
				rename = true,
				references = true,
				folding = true,
			},
		},
	})
end

function Plugin:luals()
	self.lspcfg.lua_ls.setup({
		capabilities = self.cap,
		completion = {
			callSnippet = "Replace",
		},
		settings = {
			Lua = {
				telemetry = { enable = false },
				workspace = {
					checkThirdParty = false,
					library = {
						-- Make the server aware of Neovim runtime files
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.stdpath("config") .. "/lua",
						"~/.local/state/Lua_Addonds/garrysmode",
					},
				},
				runtime = {
					version = "Lua 5.1",
					nonstandardSymbol = { "!", "!=", "&&", "||", "//", "/**/", "continue" },
				},
				diagnostics = {
					globals = { "vim" },
					disable = { "duplicate-set-field" },
				},
			},
		},
	})
end

Plugin.dependencies = {
	{ "VonHeikemen/lsp-zero.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "williamboman/mason.nvim" },
	{ "SmiteshP/nvim-navbuddy" },

	{ "aznhe21/actions-preview.nvim" },
	{ "L3MON4D3/LuaSnip" },
	{ "hrsh7th/nvim-cmp" },
}

Plugin.event = { "BufReadPre", "BufNewFile" }

function Plugin.config()
	--  LspInfo window borders
	local win = require("lspconfig.ui.windows")
	local _default_opts = win.default_opts

	win.default_opts = function(options)
		local opts = _default_opts(options)
		opts.border = "single"
		return opts
	end

	Plugin.lspcfg = require("lspconfig")
	Plugin.cap = require("cmp_nvim_lsp").default_capabilities()

	Plugin.cap.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	Plugin:lsps()
end

return Plugin
