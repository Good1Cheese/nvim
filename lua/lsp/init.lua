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

	for _, server in ipairs(M.servers) do
		local ok, config = pcall(require, "lsp.servers." .. server)
		if ok then
			vim.lsp.config(server, config)
		end
		vim.lsp.enable(server)
	end
end

return M
