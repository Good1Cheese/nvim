return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter"
        "antoinemadec/FixCursorHold.nvim",
        { "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
        { "rouge8/neotest-rust",           version = "*" }, -- Installation
    },
    opt = {
        adapters = {
            require("neotest-rust")({}),
            require("neotest-golang")({}),
        },
    }
}
