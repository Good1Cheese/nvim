local Plugin = { "VonHeikemen/lsp-zero.nvim" }

Plugin.dependencies = {
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "williamboman/mason.nvim" },
}

Plugin.event = { "BufReadPre", "BufNewFile" }

function Plugin.config()
	local lsp = require("lsp-zero")
	lsp.extend_lspconfig()
	lsp.preset("recommended")

	lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({ buffer = bufnr })
	end)

	lsp.set_server_config({
		on_init = function(client)
			client.server_capabilities.semanticTokensProvider = nil
		end,
	})

	lsp.setup()

	local function lspSymbol(name, icon)
		local hl = "DiagnosticSign" .. name
		vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
	end

	lspSymbol("Error", "󰅙")
	lspSymbol("Info", "󰋼")
	lspSymbol("Hint", "󰌵")
	lspSymbol("Warn", "")

	vim.diagnostic.config({
		virtual_text = {
			prefix = "",
		},
		signs = true,
		underline = true,
		update_in_insert = false,
	})

	--  LspInfo window borders
	local win = require("lspconfig.ui.windows")
	local _default_opts = win.default_opts

	win.default_opts = function(options)
		local opts = _default_opts(options)
		opts.border = "single"
		return opts
	end

	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	lspconfig.bashls.setup({})

	lspconfig.ruby_ls.setup({})
	-- lspconfig.rubocop.setup({})

	lspconfig.solargraph.setup({
		-- on_attach = M.on_attach,
		capabilities,
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

	lspconfig.clangd.setup({})

	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		completion = {
			callSnippet = "Replace",
		},
		settings = {
			Lua = {
				telemetry = {
					enable = false,
				},
				workspace = {
					library = {
						-- Make the server aware of Neovim runtime files
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.stdpath("config") .. "/lua",
					},
					checkThirdParty = false,
					-- library = { "~/.local/state/Lua_Addons/garrysmode/" },
				},
				diagnostics = {
					globals = { "vim" },
				},
				runtime = {
					-- nonstandardSymbol = { "||", "&&", "!", "!=", "!!", "continue", "//", "/**/" },
				},
			},
		},
	})
end

return Plugin
