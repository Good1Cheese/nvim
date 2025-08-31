return {
    "nvim-neotest/neotest",
	event = "VeryLazy",
    dependencies = {
        "fredrikaverpil/neotest-golang",
        "rouge8/neotest-rust",
        "Issafalcon/neotest-dotnet",
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-golang"),
                require("neotest-rust"),
				require("neotest-dotnet"),
            },
        })

        -- ============================================================================
        -- NEOTEST
        -- ============================================================================
        vim.keymap.set("n", "<leader>Tt", function() require("neotest").run.run() end, { desc = "Run nearest test" })
        vim.keymap.set("n", "<leader>Tf", function() require("neotest").run.run(vim.fn.expand("%:p")) end,
            { desc = "Run all tests in file" })
        vim.keymap.set("n", "<leader>Ts", function() require("neotest").summary.toggle() end,
            { desc = "Toggle test summary" })
    end,
}
