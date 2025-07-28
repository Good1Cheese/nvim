local M = {}

-- List of enabled LSP servers
M.servers = {
	"lua_ls",
	"gopls",
	"bashls",
	"pylsp",
	"docker_compose_language_service",
	"dockerls",
	"omnisharp",
	"jdtls"
}

-- Setup function
M.setup = function()
	require("lsp.opts").setup()

	vim.lsp.config("*", {
		capabilities = require("blink.cmp").get_lsp_capabilities(),
		root_markers = { ".git" },
	})

	for _, server in ipairs(M.servers) do
		-- config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
		vim.lsp.config(server, require("lsp.servers." .. server))
		vim.lsp.enable(server)
	end
end

return M
