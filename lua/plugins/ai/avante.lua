return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    version = false,
    opts = {
        input = {
            provider = "snacks",
            provider_opts = {
                -- Additional snacks.input options
                title = "Avante Input",
                icon = " ",
            },
        },
        provider = "qwen",
        providers = {
            qwen = {
                __inherited_from = "openai",
                api_key_name = "OPENROUTER_API_KEY",
                endpoint = "https://openrouter.ai/api/v1",
                model = "qwen/qwen3-235b-a22b-thinking-2507",
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope.nvim",
        "ibhagwan/fzf-lua",
        "folke/snacks.nvim",
        "saghen/blink.cmp",
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
