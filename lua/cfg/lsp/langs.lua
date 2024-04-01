local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

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
			workspace = {
				checkThirdParty = false,
				library = { "~/.local/state/Lua_Addons/garrysmode/" },
			},
			diagnostics = {
				globals = { "vim" }
			},
			runtime = {
				nonstandardSymbol = { "||", "&&", "!", "!=", "!!", "continue", "//", "/**/" },
			},
		},
	},
})

-- lspconfig.rubocop.setup({
--  capabilities = capabilities,
--  completion = {
--      callSnippet = "Replace",
--  },
-- })

-- local configs = require("lspconfig.configs")
-- local util = require("lspconfig.util")
--
-- if not configs.ruby_ls then
--  local enabled_features = {
--      "documentHighlights",
--      "documentSymbols",
--      "foldingRanges",
--      "selectionRanges",
--      -- "semanticHighlighting",
--      "formatting",
--      "codeActions",
--  }
--
--  configs.ruby_ls = {
--      default_config = {
--          cmd = { "bundle", "exec", "ruby-lsp" },
--          filetypes = { "ruby" },
--          root_dir = util.root_pattern("Gemfile", ".git"),
--          init_options = {
--              enabledFeatures = enabled_features,
--          },
--          settings = {},
--      },
--      commands = {
--          FormatRuby = {
--              function()
--                  vim.lsp.buf.format({
--                      name = "ruby_lsp",
--                      async = true,
--                  })
--              end,
--              description = "Format using ruby-lsp",
--          },
--      },
--  }
-- end
--
-- -- lspconfig.ruby_lsp.setup({})
-- lspconfig.ruby_ls.setup({ on_attach = on_attach, capabilities = capabilities })
