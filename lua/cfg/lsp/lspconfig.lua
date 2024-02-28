local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

lspconfig.bashls.setup {}
lspconfig.clangd.setup {}
lspconfig.clangformat.setup {}

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    completion = {
        callSnippet = "Replace",
    },
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = { "~/.local/state/Lua_Addons/garrysmode/" }
            },
            diagnostics = {
                enable = false
            },
            runtime = {
                nonstandardSymbol = { "||", "&&", "!", "!=", "!!", "continue", "//", "/**/" }
            }
        }
    }
})
