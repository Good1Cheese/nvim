local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clang-format" },
        sh = { "shfmt" }
	},
	-- format_on_save = {
	--     lsp_fallback = true,
	--     async = false,
	--     timeout_ms = 1000,
	-- },
})

conform.formatters["clang-format"] = {
	command = "clang-format",
	args = { "--style=file:/home/cheese/.clang-format" },
}
