local Plugin = { "hrsh7th/nvim-cmp" }

Plugin.dependencies = {
	-- Sources
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
}

Plugin.event = "InsertEnter"

function Plugin.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

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
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		},
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
				luasnip.lsp_expand(args.body)
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
		-- mapping = cmp.mapping.preset.insert({}),
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
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
	})
end

return Plugin
