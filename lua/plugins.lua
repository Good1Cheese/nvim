return {
    -- Alpha (Dashboard)
    {
        "goolord/alpha-nvim",
        lazy = true
    },

    -- Which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function( )
            vim.o.timeout = true
            vim.o.timeoutlen = 100
        end
    },

    -- Nvimtree (File Explorer)
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
    },

    -- Telescope (Fuzzy Finder)
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- BufferLine
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons"
    },

    -- Colorscheme
    {
        --  "ellisonleao/gruvbox.nvim"
        "folke/tokyonight.nvim"
    },

    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    -- Language Support
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { "williamboman/mason.nvim" }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        }
    },

    -- Noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        name = "noice",
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true
                }
            },

            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            }
        },
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
    }
}