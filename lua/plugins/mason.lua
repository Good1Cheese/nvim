local Plugin = { "mason-org/mason-lspconfig.nvim" }

Plugin.dependencies = {
	{ "mason-org/mason.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "aznhe21/actions-preview.nvim" },
	{ "L3MON4D3/LuaSnip" },
}

Plugin.event = "VeryLazy"

function Plugin.config()
	require("mason").setup({
		ui = {
			border = "rounded",
			icons = {
				package_pending = " ",
				package_installed = "󰄳 ",
				package_uninstalled = " 󰚌",
			},
			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "c",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
				cancel_installation = "<C-c>",
			},
		}
	})

	require("mason-lspconfig").setup({
		ensure_installed = {
			-- "nil_ls",
			-- "asm_lsp",
			-- "clangd",
			-- "gdscript",

			-- lua
			"lua_ls",

			-- bash
			"bashls",
			-- "shfmt",
			-- "shellcheck",

			-- go
			"gopls",
			-- "gofumpt",

			-- python
			"pylsp",
			-- "ruff",

			-- docker
			"docker_compose_language_service",
			"dockerls",
			-- "hadolint",

			"omnisharp",
			"jdtls"
		},

		automatic_enable = true
	})
end

return Plugin
