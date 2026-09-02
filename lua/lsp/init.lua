local M = {}
local lsp_tools = require("tools.lsp")

M.setup = function()
    require("lsp.opts").setup()

    for server, config in pairs(lsp_tools.configs or {}) do
        vim.lsp.config(server, config)
    end

    for _, server in ipairs(lsp_tools.servers) do
        vim.lsp.enable(server)
    end
end

return M
