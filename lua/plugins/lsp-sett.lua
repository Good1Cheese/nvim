local Plugin = { "VonHeikemen/lsp-zero.nvim" }

function Plugin.config()
	local lsp_zero = require("lsp-zero")
	lsp_zero.extend_lspconfig()

	local lsp_attach = function(client, bufnr)
		-- see :help lsp-zero-keybindings
		-- to learn the available actions
		lsp_zero.default_keymaps({ buffer = bufnr })
	end

	lsp_zero.extend_lspconfig({
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		lsp_attach = lsp_attach,
		float_border = "rounded",
		sign_text = true,
	})

	lsp_zero.setup()
end

return Plugin
