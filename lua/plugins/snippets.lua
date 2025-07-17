local Plugin = { "L3MON4D3/LuaSnip" }

Plugin.dependencies = "rafamadriz/friendly-snippets"

function Plugin.config()
	local luasnip = require("luasnip")
	local s = luasnip.snippet
	local t = luasnip.text_node
	local i = luasnip.insert_node

	luasnip.add_snippets("lua", {
		s("Plugin", {
			t("local Plugin = "),
			i(1),
			t("return Plugin"),
		}),
	})

	-- vscode format
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

	-- snipmate format
	require("luasnip.loaders.from_snipmate").load()
	require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

	-- lua format
	require("luasnip.loaders.from_lua").load()
	require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })

	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function()
			if
				require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
				and not require("luasnip").session.jump_active
			then
				require("luasnip").unlink_current()
			end
		end,
	})

	luasnip.config.setup({})
end

return Plugin
