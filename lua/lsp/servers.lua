vim.lsp.config["gopls"] = {
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
}

vim.lsp.config["luals"] = {
	-- Specific settings to send to the server. The schema for this is
	-- defined by the server. For example the schema for lua-language-server
	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
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
