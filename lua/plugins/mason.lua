local Plugin = { "williamboman/mason.nvim" }

Plugin.dependencies = {
	{ "williamboman/mason-lspconfig.nvim" },
}

Plugin.cmd = "Mason"

Plugin.opts = {
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
	ui = { border = "rounded" },
}

return Plugin
