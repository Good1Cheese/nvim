local M = {}

-- Automatically get list of servers from files in servers/ directory
M.get_servers = function()
	return {
		"rust_analyzer",
		"bashls",
		"docker_compose_language_service",
		"dockerls",
		"lua_ls",
		"gopls",
		"jdtls",
		"omnisharp",
		"pylsp",
		"superhtml",
		"yamlls"
	}
end

-- clangd
-- gofumpt
-- hadolint
-- ruff
-- shellcheck
-- shfmt
-- yamlfmt

-- Setup function
M.setup = function()
	require("lsp.opts").setup()

	vim.lsp.config("*", {
		capabilities = require("blink.cmp").get_lsp_capabilities(),
		root_markers = { ".git" },
	})

	-- Get servers automatically from directory
	local servers = M.get_servers()
	for _, server in ipairs(servers) do
		vim.lsp.enable(server)
	end

	vim.lsp.config("lua_ls", {
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
							"$HOME/.local/state/LLS-Addons/glua-api-snippets"),
					}
				}
			}
		}
	})
end

return M
