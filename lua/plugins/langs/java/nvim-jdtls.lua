return {
    "mfussenegger/nvim-jdtls",
    event = "VeryLazy",
    config = function()
        local config = {
            cmd = { "jdtls" },
            root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
            settings = { java = {} },
            init_options = {}
        }

        require("jdtls").start_or_attach(config)
    end
}
