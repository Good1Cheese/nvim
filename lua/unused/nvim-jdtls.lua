return {
	"mfussenegger/nvim-jdtls",
	event = "VeryLazy",
	config = function()
		local bundles = {
			vim.fn.glob(
				"/home/cheese/.config/nvim/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
				1
			),
		}

		vim.list_extend(
			bundles,
			vim.split(vim.fn.glob("/home/cheese/.config/nvim/java/vscode-java-test/server/*.jar", 1), "\n")
		)

		local config = {
			cmd = { "jdtls" },
			root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
			settings = { java = {} },
			init_options = {
				bundles = bundles,
			},
		}

		require("jdtls").start_or_attach(config)
	end,
}
