vim.lsp.enable({ "luals", "dockerls", "omnisharp", "docker_compose_language_service", "asm_lsp", "clangd", "nil_ls",
	"gdscript", "pylsp", "gopls", "jdtls" })

vim.lsp.config["luals"] = {
	-- Command and arguments to start the server.
	cmd = { "lua-language-server" },
	-- Filetypes to automatically attach to.
	filetypes = { "lua" },
	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	root_markers = { ".luarc.json", ".luarc.jsonc" },
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

vim.lsp.config["dockerls"] = {
	settings = {
		docker = {
			languageserver = {
				formatter = {
					ignoreMultilineInstructions = true,
				},
			},
		}
	}
}

vim.lsp.config["omnisharp"] = { cmd = { "OmniSharp" } }

vim.lsp.config["docker_compose_language_service"] = {}
vim.lsp.config["asm_lsp"] = {}
vim.lsp.config["clangd"] = {}
vim.lsp.config["nil_ls"] = {}
vim.lsp.config["gdscript"] = {}
vim.lsp.config["pylsp"] = {}
vim.lsp.config["gopls"] = {}
vim.lsp.config["jdtls"] = {}
-- vim.lsp.config["solargraph"] = {}
