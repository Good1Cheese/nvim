local statusOk, which_key = pcall(require, "which-key")
if not statusOk then return end

local setup = {
    window = {
        border = "rounded",       -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },

    ignore_missing = true,
}

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
    ["p"] = { ":Lazy<cr>", "Plugin Manager" },     -- Invoking plugin manager
    ["q"] = { ":wqall!<cr>", "Quit" },             -- Quit Neovim after saving the file
    ["k"] = { ":q<cr>", "Close window" },             -- Quit Neovim after saving the file
    ["w"] = { ":w!<cr>", "Save" },                 -- Save current file
    ["e"] = { ":Neotree toggle<cr>", "Explorer" }, -- Open nvim-tree
    ["a"] = { ":Alpha<cr>", "Start menu" },        -- Open alpha
    ["g"] = { ":Neogit<cr>", "Open git" },
    ["c"] = { ":lua vim.lsp.buf.format{async=true}<cr>", "Reformat Code" },
    ["m"] = { ":Mason<cr>", "Mason UI for Lsp" },

    -- s = {
    --     name = "Telescope",
    --     x = { ":Telescope colorscheme<cr>", "Colorscheme" },
    --     f = { ":lua require('telescope.builtin').find_files()<cr>", "Find files" },
    --     t = { ":Telescope live_grep <cr>", "Find Text Pattern In All Files" },
    --     a = { ":Telescope oldfiles<cr>", "Open Recent File" },
    --     v = { ":Telescope diagnostics<cr>", "Diagnostics" },
    --     h = { ":Telescope help_tags<cr>", "Find Help" },
    --     m = { ":Telescope man_pages<cr>", "Man Pages" },
    --     r = { ":Telescope registers<cr>", "Registers" },
    --     k = { ":Telescope keymaps<cr>", "Keymaps" },
    --     c = { ":Telescope commands<cr>", "Commands" },
    -- },

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
}

which_key.setup(setup)
which_key.register(mappings, opts)
