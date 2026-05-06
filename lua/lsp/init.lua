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
        "ts_ls",
        "html",
        "svelte",
        "svelte",
        "taplo",
        "yamlls",
        "tinymist",
        "marksman",
        "jsonls",
        "ts_ls",
        "clangd"
        -- "arduino_language_server",
    }
end

-- asm-lsp clangd jdtls omnisharp csharp-language-server
-- :MasonInstall bash-language-server shellcheck shfmt docker-compose-language-service dockerfile-language-server hadolint emmylua_ls gofumpt golangci-lint golangci-lint-langserver golines gopls revive python-lsp-server ruff rust-analyzer yaml-language-server svelte-language-server html-lsp tinymist marksman taplo emmylua-codeformat json-lsp arduino-language-server typescript-language-server clangd clang-format

vim.lsp.config('rust_analyzer', {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy", -- ← ключевая строка
                -- extraArgs = {
                -- 	"--no-deps",
                -- 	-- "--", "--deny", "warnings",  -- ← строгий режим (опционально)
                -- },
            },
        },
    }
})

vim.lsp.config("clangd", require("esp32").lsp_config())

-- Setup function
M.setup = function()
    require("lsp.opts").setup()

    -- Get servers automatically from directory
    local servers = M.get_servers()

    for _, server in ipairs(servers) do
        vim.lsp.enable(server)
    end
    -- vim.lsp.enable("arduino_language_server")
end

return M
