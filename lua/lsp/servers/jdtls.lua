-- Config for jdtls (Java LSP)
-- Note: This requires additional setup for jdtls
return {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens", "java.base/java.util=ALL-UNNAMED",
		"--add-opens", "java.base/java.lang=ALL-UNNAMED",
		"-jar", vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration", vim.fn.stdpath("data") .. "/mason/packages/jdtls/config_linux",
		"-data", vim.fn.stdpath("cache") .. "/jdtls-workspace"
	},
	filetypes = { "java" },
	root_dir = require("lsp.utils").root_pattern(
		"gradlew",
		"mvnw",
		"pom.xml",
		"build.gradle",
		".git"
	),
	init_options = {
		bundles = {}
	},
	settings = {
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
			completion = {
				favoriteStaticMembers = {
					"org.junit.Assert.*",
					"org.junit.Assume.*",
					"org.junit.jupiter.api.Assertions.*",
					"org.junit.jupiter.api.Assumptions.*",
					"org.junit.jupiter.api.DynamicContainer.*",
					"org.junit.jupiter.api.DynamicTest.*",
					"org.mockito.Mockito.*",
					"org.mockito.ArgumentMatchers.*",
					"org.mockito.Answers.*"
				}
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999
				}
			},
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk",
						default = true
					},
					{
						name = "JavaSE-11",
						path = "/usr/lib/jvm/java-11-openjdk"
					}
				}
			}
		}
	}
}
