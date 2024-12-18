local Plugin = { "neovim/nvim-lspconfig" }

Plugin.dependencies = {
    { "VonHeikemen/lsp-zero.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "williamboman/mason.nvim" },
    { "SmiteshP/nvim-navbuddy" },

    { "aznhe21/actions-preview.nvim" },
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/nvim-cmp" }
}

Plugin.event = { "BufReadPre", "BufNewFile" }

function Plugin.refactor()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local servers = {
        dockerls = {
            capabilities = capabilities,
            settings = {
                docker = {
                    languageserver = {
                        formatter = { ignoreMultilineInstructions = true }
                    }
                }
            }
        },
        bashls = {},
        asm_lsp = {},
        clangd = {},
        nil_ls = {},
        gdscript = {},
        pylsp = {},
        jdtls = {},
        solargraph = {},
        omnisharp = { capabilities = capabilities, cmd = { "OmniSharp" } },
        lua_ls = {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                        disable = { "duplicate-set-field" }
                    },
                    runtime = {
                        version = "Lua 5.1",
                        nonstandardSymbol = {
                            "!",
                            "!=",
                            "&&",
                            "||",
                            "//",
                            "/**/",
                            "continue"
                        }
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            vim.fn.expand(
                              "$HOME/.local/state/LLS-Addons/addons/garrysmod/module/library")
                        }
                    }
                }
            }
        }
    }

    local lspconfig = require("lspconfig")

    for server, opts in pairs(servers) do lspconfig[server].setup(opts) end
end

function Plugin.config()
    --  LspInfo window borders
    local win = require("lspconfig.ui.windows")
    local _default_opts = win.default_opts

    win.default_opts = function( options )
        local opts = _default_opts(options)
        opts.border = "single"
        return opts
    end

    Plugin.refactor()
end

return Plugin
