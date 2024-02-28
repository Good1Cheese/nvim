return {
    ---------------------
    -- VISUTAL PLUGINS --
    ---------------------


    -- Highlight under cursor
    require("plugins.vim-illuminate"),

    -- Buatiful indents
    -- *** IMPORTANT: this plugins do differents things,
    -- one is for CURRENT level scope, another is for ALL indents highlight
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
    { "echasnovski/mini.indentscope" },

    -- Icons
    { "nvim-tree/nvim-web-devicons" },

    -- Dashboard
    {
        "MeanderingProgrammer/dashboard.nvim",
        event = "VimEnter"
    },

    -- Colorscheme
    {
        "tiagovla/tokyodark.nvim",
        config = function()
            require("tokyodark").setup({
                transparent_background = false,      -- set background to transparent
                gamma = 1.00,                        -- adjust the brightness of the theme
                styles = {
                    comments = { italic = true },    -- style for comments
                    keywords = { italic = true },    -- style for keywords
                    identifiers = { italic = true }, -- style for identifiers
                    functions = {},                  -- style for functions
                    variables = {},                  -- style for variables
                },
            })
        end
    },

    {
        "ayu-theme/ayu-vim",
        config = function()
            vim.cmd [[
                let ayucolor="dark"
            ]]
        end
    },

    { "whatyouhide/vim-gotham" },

    {
        "wuelnerdotexe/vim-enfocado",
        config = function()
            vim.cmd [[
            augroup enfocado_customization
            autocmd!
            autocmd ColorScheme enfocado highlight Normal ctermbg=NONE guibg=NONE
            augroup END
            ]]
        end
    },

    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({ style = "darker" })
        end
    },

    {
        "mg979/vim-visual-multi",
        event = "VeryLazy"
    },
    --
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
        event = "VeryLazy"
    },


    -------------------------
    ---- EDITING PLUGINS ----
    -------------------------


    -- Undotree
    {
        "mbbill/undotree"
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
    { "fedepujol/move.nvim",       config = true },

    -- For quick commentting
    { "numToStr/Comment.nvim" },

    -- -- Quick quotes, brackets, etc
    -- {
    --     "kylechui/nvim-surround",
    --     version = "*",
    --     config = true,
    --     event = "VeryLazy",
    -- },

    -- -- Refactoring tool
    -- {
    --     "ThePrimeagen/refactoring.nvim",
    --     config = function()
    --         require("refactoring").setup()
    --     end,
    -- },


    ----------------------
    ---- CORE PLUGINS ----
    ----------------------


    -- Awesome terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true
    },

    -- Sessions manager
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = true
    },

    --  Neovim lua API Support
    {
        "folke/neodev.nvim",
        config = true,
        lazy = true
    },

    -- -- Awesome tool for comming/pushing
    -- {
    --     "NeogitOrg/neogit",
    --     config = true,
    --     lazy = true
    -- },

    -- Previewing changes
    {
        "lewis6991/gitsigns.nvim",
        config = true
    },

    -- Git difftoool
    -- { "sindrets/diffview.nvim", },

    -- Tool for async Lua
    { "nvim-lua/plenary.nvim" },

    -- File Explorer
    { "nvim-neo-tree/neo-tree.nvim" },
    {
        "kevinhwang91/rnvimr",
    },

    -- BufferLine
    {
        "romgrk/barbar.nvim",
        config = true
    },

    -- Fuzzy Finder
    { "nvim-telescope/telescope.nvim", lazy = true },

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

    -- Debugger
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        dependencies = {
            "mfussenegger/nvim-dap"
        }
    },
    { "theHamsta/nvim-dap-virtual-text", lazy = true },


    -- Code formatting
    {
        "stevearc/conform.nvim",
        lazy = true,
        -- event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    },

    -- Language Support
    {
        "VonHeikemen/lsp-zero.nvim",
        config = function()
            require("lsp-zero").extend_lspconfig()
        end,
        version = false,
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },                       -- Required
            { "williamboman/mason.nvim",          opts = {} }, -- Optional
            { "williamboman/mason-lspconfig.nvim" },           -- Optional

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
