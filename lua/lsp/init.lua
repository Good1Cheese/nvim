local M = {}

-- Automatically get list of servers from files in servers/ directory
M.get_servers = function()
	return {
		"rust_analyzer",
		"bashls",
		"docker_compose_language_service",
		"dockerls",
		"emmylua_ls",
		"gopls",
		"golangci_lint_ls",
		"jdtls",
		"omnisharp",
		-- "csharp_ls",
		"pylsp",
		"superhtml",
		"yamlls",
		"jsonls"
	}
end

-- asm-lsp clangd jdtls json-lsp omnisharp csharp-language-server
-- :MasonInstall bash-language-server shellcheck shfmt docker-compose-language-service dockerfile-language-server hadolint emmylua_ls gofumpt golangci-lint golangci-lint-langserver golines gopls revive python-lsp-server ruff rust-analyzer yaml-language-server

-- Setup function
M.setup = function()
	require("lsp.opts").setup()

	-- Get servers automatically from directory
	local servers = M.get_servers()
	for _, server in ipairs(servers) do
		vim.lsp.enable(server)
	end
end

return M
