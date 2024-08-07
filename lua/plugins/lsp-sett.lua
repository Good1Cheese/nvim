local Plugin = { "VonHeikemen/lsp-zero.nvim" }

function Plugin.config()
	local lsp = require("lsp-zero")
	lsp.extend_lspconfig()
	lsp.preset("recommended")

	lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({ buffer = bufnr })
	end)

	lsp.set_server_config({
		on_init = function(client)
			client.server_capabilities.semanticTokensProvider = nil
			-- client.server_capabilities.textDocument.foldingRange = {
			-- 	dynamicRegistration = false,
			-- 	lineFoldingOnly = true,
			-- }
		end,
	})

	lsp.setup()

	local function lspSymbol(name, icon)
		local hl = "DiagnosticSign" .. name
		vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
	end

	lspSymbol("Error", "󰅙")
	lspSymbol("Info", "󰋼")
	lspSymbol("Hint", "󰌵")
	lspSymbol("Warn", "")

	vim.diagnostic.config({
		virtual_text = {
			prefix = "",
		},
		signs = true,
		underline = true,
		update_in_insert = false,
	})
end

return Plugin
