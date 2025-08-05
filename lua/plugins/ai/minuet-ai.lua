return {
    "milanglacier/minuet-ai.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "Saghen/blink.cmp",
    },
    config = function()
        require("minuet").setup {
            provider = "openai_compatible",
            request_timeout = 2.5,
            throttle = 1500, -- Increase to reduce costs and avoid rate limits
            debounce = 600, -- Increase to reduce costs and avoid rate limits
            provider_options = {
                openai_compatible = {
                    api_key = "OPENROUTER_API_KEY",
                    end_point = "https://openrouter.ai/api/v1/chat/completions",
                    model = "deepseek/deepseek-chat-v3-0324",
                    name = "Openrouter",
                },
            },
        }
    end,
}
