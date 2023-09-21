local cmp = require("cmp")
local lsp = require("lsp-zero")

cmp.setup({
    experimental = {
        ghost_text = true,
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged }
    },
    mapping = {
        ["<cr>"] = cmp.mapping.confirm({ select = true })
    }
})
