local M = {}

M.packages = {
    -- LSP servers
    "rust-analyzer",
    "bash-language-server",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "emmylua_ls",
    "gopls",
    "golangci-lint-langserver",
    "jdtls",
    "omnisharp",
    "python-lsp-server",
    "typescript-language-server",
    "html-lsp",
    "svelte-language-server",
    "taplo",
    "yaml-language-server",
    "tinymist",
    "marksman",
    "json-lsp",
    "clangd",

    -- Linters and formatters
    "shellcheck",
    "shfmt",
    "hadolint",
    "gofumpt",
    "golangci-lint",
    "golines",
    "revive",
    "ruff",
    "clang-format",
    "emmylua-codeformat",
}

local function notify_list(title, items, level)
    if #items == 0 then
        return
    end

    vim.notify(title .. ":\n  " .. table.concat(items, "\n  "), level or vim.log.levels.INFO, {
        title = "Mason",
    })
end

function M.install_missing()
    local ok, registry = pcall(require, "mason-registry")
    if not ok then
        vim.notify("Mason is not loaded", vim.log.levels.ERROR)
        return
    end

    registry.refresh(function()
        local missing = {}
        local unknown = {}

        for _, name in ipairs(M.packages) do
            local package_ok, package = pcall(registry.get_package, name)
            if not package_ok then
                table.insert(unknown, name)
            elseif not package:is_installed() then
                table.insert(missing, name)
            end
        end

        notify_list("Unknown packages", unknown, vim.log.levels.WARN)

        if #missing == 0 then
            vim.notify("All configured tools are installed", vim.log.levels.INFO, { title = "Mason" })
            return
        end

        vim.cmd("MasonInstall " .. table.concat(missing, " "))
    end)
end

return M
