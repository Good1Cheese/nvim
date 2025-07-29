local M = {}

-- Automatically get list of servers from files in servers/ directory
M.get_servers = function()
    local servers_dir = vim.fn.stdpath("config") .. "/lua/lsp/servers"
    local files = vim.fn.glob(servers_dir .. "/*.lua", false, true)
    local servers = {}

    for _, file in ipairs(files) do
        -- Extract server name from filename (remove path and .lua extension)
        local server = file:match("([^/]+)%.lua$")
        table.insert(servers, server)
    end

    return servers
end

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
        vim.lsp.config(server, require("lsp.servers." .. server))
        vim.lsp.enable(server)
    end
end

return M
