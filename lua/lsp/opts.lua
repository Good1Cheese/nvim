local M = {}

local function on_attach(bufnr)
    local function nmap(keys, action, desc)
        vim.keymap.set("n", keys, action, {
            buffer = bufnr,
            desc = "LSP: " .. desc,
        })
    end

    -- Keep the existing muscle-memory mappings in addition to Neovim's
    -- built-in LSP defaults such as grn/gra/grr/gri.
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("gd", vim.lsp.buf.definition, "Goto Definition")
    nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
    nmap("gi", vim.lsp.buf.implementation, "Goto Implementation")
    nmap("go", vim.lsp.buf.type_definition, "Goto Type Definition")
    nmap("gr", vim.lsp.buf.references, "References")
    nmap("gs", vim.lsp.buf.signature_help, "Signature Help")
    nmap("<F2>", vim.lsp.buf.rename, "Rename")
    nmap("<F4>", vim.lsp.buf.code_action, "Code Action")
end

function M.setup()
    local group = vim.api.nvim_create_augroup("UserLsp", { clear = true })

    vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        desc = "Install buffer-local LSP mappings",
        callback = function(args)
            on_attach(args.buf)
        end,
    })
end

return M
