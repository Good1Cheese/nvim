return {
    -----------------
    -- DEV PLUGINS --
    -----------------


    { "development/aliasRemove.nvim", dev = true },


    ---------------------
    -- VISUTAL PLUGINS --
    ---------------------


    -- Icons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },

    -- Dashboard
    {
        "goolord/alpha-nvim",
        lazy = true
    },

    -- Marks for indents
    { "lukas-reineke/indent-blankline.nvim" },

    -- Colorscheme
    { "folke/tokyonight.nvim" },

    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        config = true
    },


    -------------------------
    ---- EDITING PLUGINS ----
    -------------------------


    -- Delete without coping
    {
        "gbprod/cutlass.nvim",
        config = true
    },

    -- Auto-Pairs
    { "windwp/nvim-autopairs" },

    -- Moving things across lines
    { "fedepujol/move.nvim" },

    -- For quick commentting
    { "numToStr/Comment.nvim" },

    -- Undo-Tree
    {
        "jiaoshijie/undotree",
        config = true
    },

    -- Quick quotes, brackets, etc
    {
        "kylechui/nvim-surround",
        version = "*",
        config = true,
        event = "VeryLazy",
    },


    ----------------------
    ---- CORE PLUGINS ----
    ----------------------

    {
        "NeogitOrg/neogit",
        config = true
    },

    -- Git difftoool
    {
        "sindrets/diffview.nvim"
    },

    -- Terminal support
    {
        "akinsho/toggleterm.nvim",
        config = true
    },

    -- Tool for async Lua
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },

    -- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        config = true,
        lazy = true
    },

    -- BufferLine
    {
        "romgrk/barbar.nvim",
        config = true
    },

    -- Treesitter (Parser)
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

    -- Fuzzy Finder
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        tag = "0.1.1"
    },

    {
        "ray-x/guihua.lua",
        build = "cd lua/fzy && make"
    },

    {
        "ray-x/sad.nvim",
        config = function()
            require("sad").setup()
        end
    },

    -- Which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 100
        end
    },

    -- Language Support
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },             -- Required
            { "williamboman/mason.nvim" },           -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },         -- Required
            { "hrsh7th/cmp-nvim-lsp" },     -- Required
            { "hrsh7th/cmp-buffer" },       -- Optional
            { "hrsh7th/cmp-path" },         -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" },     -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" },             -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        }
    },

    -- Noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = true,
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
    }
}
