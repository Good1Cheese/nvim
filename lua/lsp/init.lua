local M = {}

-- Automatically get list of servers from files in servers/ directory
M.get_servers = function()
    return {
        "bashls",
        "docker_compose_language_service",
        "dockerls",
        "emmylua_ls",
        "rust_analyzer",
        "gopls",
        "jdtls",
        "omnisharp",
        "pylsp",
        "superhtml",
        "yamlls"
    }
end

-- asm-lsp
-- bash-language-server
-- clangd
-- docker-compose-language-service
-- dockerfile-language-server
-- emmylua_ls
-- gofumpt
-- gopls
-- hadolint
-- jdtls
-- lua-language-server
-- omnisharp
-- python-lsp-server
-- ruff
-- shellcheck
-- shfmt
-- superhtml
-- yaml-language-server
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
end

return M
