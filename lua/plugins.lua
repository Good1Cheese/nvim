return {
    ---------------------
    -- VISUTAL PLUGINS --
    ---------------------

    -- Buatiful indents
    require("plugins.indents-highlight"),
    require("plugins.indents-scope"),

    -- Highlight under cursor
    require("plugins.vim-illuminate"),

    -- Icons
    { "nvim-tree/nvim-web-devicons" },

    -- Dashboard
    {
        "goolord/alpha-nvim",
        lazy = true
    },

    -- Colorscheme
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({ style = "warmer" })
            vim.cmd.colorscheme("onedark")
        end
    },

    -- Treesitter hepler
    {
        "m-demare/hlargs.nvim",
        config = true
    },

    -- Treesitter (Parser)
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        opts = { theme = "onedark" },
        event = "VeryLazy"
    },


    -------------------------
    ---- EDITING PLUGINS ----
    -------------------------


    -- Undotree
    { "mbbill/undotree" },

    -- Better escape
    {
        "max397574/better-escape.nvim",
        config = true
    },

    -- Fix for Russian Layout
    { "powerman/vim-plugin-ruscmd" },

    -- Delete without coping
    {
        "gbprod/cutlass.nvim",
        config = true
    },

    -- Auto-Pairs
    {
        "windwp/nvim-autopairs",
        config = true
    },

    -- Moving things across lines
    { "fedepujol/move.nvim" },

    -- For quick commentting
    { "numToStr/Comment.nvim" },

    -- Quick quotes, brackets, etc
    {
        "kylechui/nvim-surround",
        version = "*",
        config = true,
        event = "VeryLazy",
    },

    -- Refactoring tool
    {
        "ThePrimeagen/refactoring.nvim",
        config = function()
            require("refactoring").setup()
        end,
    },


    ----------------------
    ---- CORE PLUGINS ----
    ----------------------


    -- Sessions manager
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = true
    },

    --  Neovim lua API Support
    {
        "folke/neodev.nvim",
        config = true
    },

    -- Awesome tool for comming/pushing
    {
        "NeogitOrg/neogit",
        config = true
    },

    -- Previewing changes
    {
        "lewis6991/gitsigns.nvim",
        config = true
    },

    -- Git difftoool
    { "sindrets/diffview.nvim" },

    -- Tool for async Lua
    { "nvim-lua/plenary.nvim" },

    -- File Explorer
    { "nvim-neo-tree/neo-tree.nvim" },

    -- BufferLine
    {
        "romgrk/barbar.nvim",
        config = true
    },

    -- Fuzzy Finder
    { "nvim-telescope/telescope.nvim" },

    -- Gui library for plugins
    {
        "ray-x/guihua.lua",
        build = "cd lua/fzy && make"
    },

    -- Gui commands support
    { "equalsraf/neovim-gui-shim" },

    -- Which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy"
    },

    -- Language Support
    {
        "VonHeikemen/lsp-zero.nvim",
        version = false,
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },             -- Required
            { "williamboman/mason.nvim", opts ={} }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },         -- Required
            { "hrsh7th/cmp-nvim-lsp" },     -- Required
            { "hrsh7th/cmp-buffer" },       -- Optional
            { "hrsh7th/cmp-path" },         -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional

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
