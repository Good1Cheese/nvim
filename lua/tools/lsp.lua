local M = {}

-- LSP config names from nvim-lspconfig. Mason package names live separately in
-- tools/mason.lua because Mason installs executables while vim.lsp enables
-- editor integrations.
M.servers = {
    "rust_analyzer",
    "bashls",
    "docker_compose_language_service",
    "dockerls",
    "emmylua_ls",
    "gopls",
    "golangci_lint_ls",
    "jdtls",
    "omnisharp",
    "pylsp",
    "ts_ls",
    "html",
    "svelte",
    "taplo",
    "yamlls",
    "tinymist",
    "marksman",
    "jsonls",
    "clangd",
}

local function normalize(path)
    if not path or path == "" then
        return nil
    end
    return vim.uv.fs_realpath(path) or vim.fs.normalize(path)
end

-- Only settings that differ from nvim-lspconfig defaults belong here.
M.configs = {
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                check = {
                    command = "clippy",
                },
            },
        },
    },

    emmylua_ls = {
        on_init = function(client)
            local workspace = client.workspace_folders and client.workspace_folders[1]
            if not workspace then
                return
            end

            -- Neovim runtime/plugin libraries are useful for this config, but
            -- should not be injected into every unrelated Lua project.
            if normalize(workspace.name) ~= normalize(vim.fn.stdpath("config")) then
                return
            end

            local library = { vim.env.VIMRUNTIME }
            local lazy_root = vim.fn.stdpath("data") .. "/lazy"
            if vim.uv.fs_stat(lazy_root) then
                table.insert(library, lazy_root)
            end

            client.config.settings = vim.tbl_deep_extend("force", client.config.settings or {}, {
                emmylua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = library },
                },
            })
        end,
    },
}

return M
