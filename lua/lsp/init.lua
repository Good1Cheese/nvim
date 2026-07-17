local M = {}
local lsp_tools = require("tools.lsp")

M.get_servers = function()
    return vim.deepcopy(lsp_tools.servers)
end

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    },
})

M.setup = function()
    require("lsp.opts").setup()

    for _, server in ipairs(lsp_tools.servers) do
        vim.lsp.enable(server)
    end
end

return M
