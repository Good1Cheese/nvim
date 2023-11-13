-- LSP
local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.set_server_config({
    on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end
})

lsp.setup()
