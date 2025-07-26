local Plugin = { "neovim/nvim-lspconfig" }

Plugin.dependencies = {
	{ "williamboman/mason.nvim" },
	{ "aznhe21/actions-preview.nvim" },
	{ "L3MON4D3/LuaSnip" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim", },
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

	-- This is where you enable features that only work
	-- if there is a language server active in the file

	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function(event)
			local opts = { buffer = event.buf }


			vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
			vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
			vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
			vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
			vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		end,
	})

	local servers = {
		-- erlangls = {},
		-- asm_lsp = {},
		-- clangd = {},
		-- nil_ls = {},
		-- gdscript = {},
		-- solargraph = {},

		dockerls = {},
		docker_compose_language_service = {},
		bashls = {},
		pylsp = {},
		gopls = {
			staticcheck = true,
			gofumpt = false,
			completeUnimported = true,
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			analyses = {
				fieldalignment = true,
				nilness = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
			},
			usePlaceholders = true,
		},
		jdtls = {},
		omnisharp = {},

		lua_ls = {
			settings = {
				Lua = {
					format = {
						enable = true,
						-- Put format options here
						-- NOTE: the value should be STRING!!
						-- https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/docs/format_config_EN.md
						defaultConfig = {
							indent_style = "space",
							quote_style = "double",
							indent_size = "4",
							align_call_args = "true",
							max_line_length = "120",
							align_continuous_assign_statement = "true"
						}
					},
					completion = {
						callSnippet = "Both"
					},
					diagnostics = {
						globals = { "vim" },
						disable = { "duplicate-set-field" }
					},
					runtime = {
						version = "Lua 5.1",
						nonstandardSymbol = {
							"!",
							"!=",
							"&&",
							"||",
							"//",
							"/**/",
							"continue"
						}
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							vim.fn.expand(
								"$HOME/.local/state/LLS-Addons/glua-api-snippets")
						}
					}
				}
			}
		}
	}

	-- local ensure_installed = vim.tbl_keys(servers or {})
	-- vim.list_extend(ensure_installed, {
	-- 	"shfmt",
	-- 	"shellcheck",
	-- 	"hadolint",
	-- 	"gofumpt",
	-- 	"ruff"
	-- })
	-- require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	local lspconfig = require("lspconfig")
	for server, config in pairs(servers) do
		config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
		lspconfig[server].setup(config)
	end
end

return Plugin
