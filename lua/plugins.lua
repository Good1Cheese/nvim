return {
    -----------------
    -- DEV PLUGINS --
    -----------------


    { "development/aliasRemove.nvim" },


    ---------------------
    -- VISUTAL PLUGINS --
    ---------------------


    -- Icons
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- Dashboard
    { "goolord/alpha-nvim", lazy = true },

    -- Marks for indents
    { "lukas-reineke/indent-blankline.nvim" },

    -- Colorscheme
    { "folke/tokyonight.nvim" },

    -- Lualine
    { "nvim-lualine/lualine.nvim" },


    -------------------------
    ---- EDITING PLUGINS ----
    -------------------------


    -- Delete without coping
    { "gbprod/cutlass.nvim", opts = {} },

    -- Auto-Pairs
    { "windwp/nvim-autopairs" },

    -- Moving things across lines
    { "fedepujol/move.nvim" },

    -- For quick commentting
    { "numToStr/Comment.nvim" },

    -- Quick quotes, brackets, etc
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function() require("nvim-surround").setup() end
    },

    ----------------------
    ---- CORE PLUGINS ----
    ----------------------


    -- File Explorer
    { "nvim-tree/nvim-tree.lua", lazy = true },

    -- Treesitter (Parser)
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

    -- BufferLine
    { "akinsho/bufferline.nvim" },

    -- Fuzzy Finder
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        tag = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" }
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
        branch = "v1.x",
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
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
    }
}
