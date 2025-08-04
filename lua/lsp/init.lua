local M = {}

-- Automatically get list of servers from files in servers/ directory
M.get_servers = function()
    return {
        "bashls",
        "docker_compose_language_service",
        "dockerls",
        "emmylua_ls",
        "gopls",
        "jdtls",
        "omnisharp",
        "pylsp",
        "superhtml",
        "yamlls"
    }
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
        vim.lsp.enable(server)
    end
end

return M
