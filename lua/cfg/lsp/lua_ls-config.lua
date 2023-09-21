local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
    completion = {
        callSnippet = "Replace",
    },
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = { "/home/pashkevich/.local/state/Lua_Addons/garrysmode/" }
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
