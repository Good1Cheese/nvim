local Plugin = { "neovim/nvim-lspconfig" }

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

	Plugin.refactor()
end

function Plugin.refactor()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local servers = {
		bashls = {},
		asm_lsp = {},
		clangd = {},
		nil_ls = {},
		gdscript = {},
		pylsp = {},
		solargraph = {},

		-- -- VS https://github.com/mfussenegger/nvim-jdtls
		jdtls = {},

		lua_ls = {
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
						},
					},
					diagnostics = {
						globals = { "vim" },
						disable = { "duplicate-set-field" },
					},
				},
			},
		},
	}

	for server, opts in pairs(servers) do
		require("lspconfig")[server].setup({
			capabilities = capabilities,
			settings = opts,
		})
	end
end

return Plugin
