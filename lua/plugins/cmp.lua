local Plugin = { "hrsh7th/nvim-cmp" }

Plugin.dependencies = {
	-- Sources
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },

	-- Snippets
	{ "L3MON4D3/LuaSnip" }, -- Required
	{ "rafamadriz/friendly-snippets" }, -- Optional
}

Plugin.event = "InsertEnter"

function Plugin.config()
	local luasnip = require("luasnip")

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

	local cmp = require("cmp")

	local function border(hl_name)
		return {
			{ "╭", hl_name },
			{ "─", hl_name },
			{ "╮", hl_name },
			{ "│", hl_name },
			{ "╯", hl_name },
			{ "─", hl_name },
			{ "╰", hl_name },
			{ "│", hl_name },
		}
	end

	cmp.setup({
		window = {
			completion = {
				-- border = border("CmpDocBorder"),
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
				scrolloff = 0,
				col_offset = 0,
				side_padding = 1,
				scrollbar = true,
			},
			documentation = {
				border = border("CmpDocBorder"),
				winhighlight = "Normal:CmpDoc",
			},
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		completion = {
			autocomplete = {
				cmp.TriggerEvent.TextChanged,
			},
			completeopt = "menu,menuone,noselect",
			keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
			keyword_length = 1,
		},
		mapping = {
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-k>"] = cmp.mapping.open_docs(),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(
						vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
						""
					)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif require("luasnip").jumpable(-1) then
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
				else
					fallback()
				end
			end, { "i", "s" }),
		},
	})
end

return Plugin
