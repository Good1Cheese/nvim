require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false
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

