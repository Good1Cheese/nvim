-- LSP

local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.setup_servers({ "lua_ls" })
lsp.setup()

-- CMP

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    mapping = {
        ["<cr>"] = cmp.mapping.confirm({ select = false }),
    }
})

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        {
            name = "buffer",
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            },
        },
    },
}

-- Additional capabilities

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities
        })
    end
})


require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})
