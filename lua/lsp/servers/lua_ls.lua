return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
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
