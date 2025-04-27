local Plugin = { "neovim/nvim-lspconfig" }

Plugin.dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "williamboman/mason.nvim" },
    { "SmiteshP/nvim-navbuddy" },

    { "aznhe21/actions-preview.nvim" },
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/nvim-cmp" },
    { 'saghen/blink.cmp' },
}

Plugin.event = { "BufReadPre", "BufNewFile" }

function Plugin.refactor()
    -- Reserve a space in the gutter
    vim.opt.signcolumn = "yes"

    -- This is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
            local opts = { buffer = event.buf }

            vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
            vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
            vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
            vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
            vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
            vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
            vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
            vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
            vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
            vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        end,
    })

    local servers = {
        dockerls = {
            settings = {
                docker = {
                    languageserver = {
                        formatter = {
                            ignoreMultilineInstructions = true,
                        },
                    },
                }
            }
        },
        docker_compose_language_service = {},
        erlangls = {},
        bashls = {},
        asm_lsp = {},
        clangd = {},
        nil_ls = {},
        gdscript = {},
        pylsp = {},
        gopls = {},
        jdtls = {},
        -- solargraph = {},
        omnisharp = { cmd = { "OmniSharp" } },

        lua_ls = {
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

    for server, config in pairs(servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
end

function Plugin.config()
    require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", --[[ "omnisharp" ]] "dockerls",
            "docker_compose_language_service", "gopls", "bashls",
            "clangd", "jdtls" },
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
