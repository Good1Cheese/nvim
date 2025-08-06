-- lsp/opts.lua
local on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
        if desc then desc = "LSP: " .. desc end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("gd", vim.lsp.buf.definition, "Goto Definition")
    nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
    nmap("gi", vim.lsp.buf.implementation, "Goto Implementation")
    nmap("go", vim.lsp.buf.type_definition, "Goto Type Definition")
    nmap("gr", vim.lsp.buf.references, "References")
    nmap("gs", vim.lsp.buf.signature_help, "Signature Help")
    nmap("<F2>", vim.lsp.buf.rename, "Rename")
    nmap("<F3>", vim.lsp.buf.format, "Format")
    nmap("<F4>", vim.lsp.buf.code_action, "Code Action")

    -- Format on save
    -- if not client.supports_method("textDocument/willSaveWaitUntil") then
    -- 	vim.api.nvim_create_autocmd("BufWritePre", {
    -- 		buffer = bufnr,
    -- 		callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end
    -- 	})
    -- end
    --
    -- -- Document highlighting
    -- if client.supports_method("textDocument/documentHighlight") then
    -- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    -- 		buffer = bufnr,
    -- 		callback = vim.lsp.buf.document_highlight
    -- 	})
    -- 	vim.api.nvim_create_autocmd("CursorMoved", {
    -- 		buffer = bufnr,
    -- 		callback = vim.lsp.buf.clear_references
    -- 	})
    -- end
end

return {
    setup = function()
        -- Attach to LSP
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                on_attach(client, args.buf)
            end
        })
    end
}
