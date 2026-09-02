local M = {}

-- Single, intentionally boring source of truth for external tools managed by
-- Mason. Keep Mason registry package names here, not nvim-lspconfig names.
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
    "csharpier",
}

local function notify_list(title, items, level)
    if #items == 0 then
        return
    end

    vim.notify(title .. ":\n  " .. table.concat(items, "\n  "), level or vim.log.levels.INFO, {
        title = "Mason",
    })
end

---Install every package declared in M.packages.
---By default already-installed packages are skipped. `:MasonInstallAll!` asks
---Mason to reinstall configured packages as well.
---@param command_opts? table
function M.install_all(command_opts)
    local ok, registry = pcall(require, "mason-registry")
    if not ok then
        vim.notify("Mason is not loaded", vim.log.levels.ERROR, { title = "Mason" })
        return
    end

    local force = command_opts and command_opts.bang or false

    registry.refresh(function()
        vim.schedule(function()
            local to_install = {}
            local unknown = {}

            for _, name in ipairs(M.packages) do
                local package_ok, package = pcall(registry.get_package, name)
                if not package_ok then
                    table.insert(unknown, name)
                elseif force or not package:is_installed() then
                    table.insert(to_install, name)
                end
            end

            notify_list("Unknown packages", unknown, vim.log.levels.WARN)

            if #to_install == 0 then
                vim.notify("All configured tools are already installed", vim.log.levels.INFO, { title = "Mason" })
                return
            end

            vim.cmd("MasonInstall " .. table.concat(to_install, " "))
        end)
    end)
end

return M
