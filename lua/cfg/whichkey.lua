local statusOk, which_key = pcall(require, "which-key")
if not statusOk then return end

local setup    = {
    window = {
        border = "rounded",       -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },

    ignore_missing = true,
}

local opts     = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local Terminal = require("toggleterm.terminal").Terminal
local fish     = Terminal:new({ cmd = "fish", hidden = true })

function _fish_toggle()
    fish:toggle()
end

-- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

local mappings = {
    ["p"]  = { ":Lazy<cr>", "Plugin Manager" },
    ["q"]  = { ":qall!<cr>", "Quit" },
    -- ["c"]  = { ":q<cr>", "Close window" },
    ["c"]  = { ":lua _fish_toggle()<cr>", "Terminal" },
    ["e"]  = { ":Neotree toggle<cr>", "Explorer" },
    ["a"]  = { ":Dashboard<cr>", "Start menu" },
    -- ["g"]  = { ":Neogit<cr>", "Open git" },
    -- ["m"]  = { ":Mason<cr>", "Mason UI for Lsp" },
    ["u"]  = { ":UndotreeToggle<cr>", "Undotree" },
    ["\""] = { ":%s/\'/\"/g", "Replace all quotes" },

    -- r = {
    --     name = "Refactoring",
    --     e = { ":Refactor extract_block" }
    -- },
    s      = {
        name = "Telescope",
        d = { ":lua require('telescope.builtin').find_files()<cr>", "Find files" },
        a = { ":Telescope oldfiles<cr>", "Open Recent File" },
        s = { ":Telescope live_grep <cr>", "Find Text" },
        -- v = { ":Telescope diagnostics<cr>", "Diagnostics" },
        -- k = { ":Telescope keymaps<cr>", "Keymaps" },
        -- c = { ":Telescope commands<cr>", "Commands" },
    },

    d      = {
        name = "Debug",
        d = { ":lua require('dapui').toggle()<cr>", "Toggle" },
        s = { ":lua require('dapui').open({ reset = true })<cr>", "Reset windows" },
        a = { ":DapContinue<cr>", "Continue" },
        f = { ":DapTerminate<cr>", "Terminate" },
    },

    ["h"]  = { ":DapToggleBreakpoint<cr>", "BreakPoint" },
    ["l"]  = { ":DapStepOver<cr>", "Step over" },
    ["k"]  = { ":DapStepInto<cr>", "Step into" },
    ["j"]  = { ":DapStepOut<cr>", "Step out" },

    -- t = {
    --     name = "Terminal",
    --     f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, -- Floating Terminal
    --
    --     -- Play with size according to your needs.
    --     h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- Horizontal Terminal
    --     v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },     -- Vertical Terminal
    -- },

    -- LSP
    -- l = {
    --     name = "LSP",
    --     a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    --     i = { ":LspInfo<cr>", "Info" },
    --     l = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    --     r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
    --     s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
    --     S = {
    --         ":Telescope lsp_dynamic_workspace_symbols<cr>",
    --         "Workspace Symbols",
    --     },
    -- },
    -- lsp.on_attach(function(client, bufnr)
    -- --     local opts = { buffer = bufnr, remap = false }
    -- --
    -- --     vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    -- --     vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    -- --     vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    -- --     vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    -- --     vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    -- --     vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    -- --     vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    -- --     vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    -- --     vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    -- --     vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    -- -- end)
    --
}

which_key.setup(setup)
which_key.register(mappings, opts)
