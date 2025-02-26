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
        gopls = {},
        jdtls = {},
        -- solargraph = {},
        omnisharp = { capabilities = capabilities, cmd = { "OmniSharp" } },
        lua_ls = {
            capabilities = capabilities,
            settings = {
                Lua = {
                    format = {
                        enable = true,
                        -- Put format options here
                        -- NOTE: the value should be STRING!!
                        -- https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/docs/format_config_EN.md
                        defaultConfig = {
                            indent_style = "space",
                            quote_style = "double",
                            indent_size = "4",
                            align_call_args = "true",
                            max_line_length = "120",
                            align_continuous_assign_statement = "true"
                        }
                    },
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
                                "$HOME/.local/state/LLS-Addons/glua-api-snippets")
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
    require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "gopls", "bashls", "clangd", "jdtls" },
    }

    --  LspInfo window borders
    local win = require("lspconfig.ui.windows")
    local _default_opts = win.default_opts

    win.default_opts = function(options)
        local opts = _default_opts(options)
        opts.border = "single"
        return opts
    end

    Plugin.refactor()
end

return Plugin
