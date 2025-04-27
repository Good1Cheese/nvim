-- local Plugin = { "hrsh7th/nvim-cmp" }
--
-- Plugin.dependencies = {
-- 	-- Sources
-- 	{ "hrsh7th/cmp-nvim-lsp" },
-- 	{ "hrsh7th/cmp-buffer" },
-- 	{ "hrsh7th/cmp-path" },
-- 	{ "saadparwaiz1/cmp_luasnip" },
-- }
--
-- Plugin.event = "InsertEnter"
--
-- function Plugin.config()
-- 	local cmp = require("cmp")
-- 	local luasnip = require("luasnip")
-- 	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
--
-- 	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
--
-- 	local function border(hl_name)
-- 		return {
-- 			{ "╭", hl_name },
-- 			{ "─", hl_name },
-- 			{ "╮", hl_name },
-- 			{ "│", hl_name },
-- 			{ "╯", hl_name },
-- 			{ "─", hl_name },
-- 			{ "╰", hl_name },
-- 			{ "│", hl_name },
-- 		}
-- 	end
--
-- 	cmp.setup({
-- 		sources = {
-- 			{ name = "nvim_lsp" },
-- 			{ name = "luasnip" },
-- 		},
-- 		window = {
-- 			completion = {
-- 				-- border = border("CmpDocBorder"),
-- 				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
-- 				scrolloff = 0,
-- 				col_offset = 0,
-- 				side_padding = 1,
-- 				scrollbar = true,
-- 			},
-- 			documentation = {
-- 				border = border("CmpDocBorder"),
-- 				winhighlight = "Normal:CmpDoc",
-- 			},
-- 		},
-- 		snippet = {
-- 			expand = function(args)
-- 				luasnip.lsp_expand(args.body)
-- 			end,
-- 		},
-- 		completion = {
-- 			autocomplete = {
-- 				cmp.TriggerEvent.TextChanged,
-- 			},
-- 			completeopt = "menu,menuone,noselect",
-- 			keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
-- 			keyword_length = 1,
-- 		},
-- 		-- mapping = cmp.mapping.preset.insert({}),
-- 		mapping = {
-- 			["<C-p>"] = cmp.mapping.select_prev_item(),
-- 			["<C-n>"] = cmp.mapping.select_next_item(),
-- 			["<C-d>"] = cmp.mapping.scroll_docs(-4),
-- 			["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 			["<C-k>"] = cmp.mapping.open_docs(),
-- 			["<C-Space>"] = cmp.mapping.complete(),
-- 			["<C-e>"] = cmp.mapping.close(),
-- 			["<CR>"] = cmp.mapping.confirm({
-- 				behavior = cmp.ConfirmBehavior.Insert,
-- 				select = true,
-- 			}),
-- 			["<Tab>"] = cmp.mapping(function(fallback)
-- 				if cmp.visible() then
-- 					cmp.select_next_item()
-- 				elseif luasnip.expand_or_jumpable() then
-- 					luasnip.expand_or_jump()
-- 				else
-- 					fallback()
-- 				end
-- 			end, { "i", "s" }),
-- 			["<S-Tab>"] = cmp.mapping(function(fallback)
-- 				if cmp.visible() then
-- 					cmp.select_prev_item()
-- 				elseif luasnip.jumpable(-1) then
-- 					luasnip.jump(-1)
-- 				else
-- 					fallback()
-- 				end
-- 			end, { "i", "s" }),
-- 		},
-- 	})
-- end
--
-- return Plugin

return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets", "onsails/lspkind.nvim" },
	version = "1.*",
	lazy = false,
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap

		keymap = {
			preset = "enter",

			["<C-f>"] = { function(cmp) cmp.scroll_documentation_up(4) end },
			["<C-d>"] = { function(cmp) cmp.scroll_documentation_down(4) end },

			["<Tab>"] = {
				function(cmp)
					if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then return cmp.accept() end
				end,
				"show_and_insert",
				"select_next",
			},
			["<S-Tab>"] = { "show_and_insert", "select_prev" },
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "normal"
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			accept = {
				auto_brackets = {
					enabled = true
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
			},

			list = {
				selection = {
					preselect = false,
					auto_insert = false
				}
			},

			menu = {
				min_width = 50,
				max_height = 20,

				draw = {
					treesitter = { "lsp" },
					padding = 2,
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbolic(ctx.kind, {
										mode = "symbol",
									})
								end

								return icon .. ctx.icon_gap
							end,

							-- Optionally, use the highlight groups from nvim-web-devicons
							-- You can also add the same function for `kind.highlight` if you want to
							-- keep the highlight groups in sync with the icons.
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										hl = dev_hl
									end
								end
								return hl
							end,
						}
					}
				}
				-- auto_show = false, -- onlycompletion.menu.auto_show = false -- only show menu on manual <C-space> show menu on manual <C-space>
			},
			ghost_text = {
				enabled = true,
				-- show_with_menu = false,
			},
		},

		signature = { enabled = true },
		sources = { default = { "lsp", "path", "snippets", "buffer" }, },
		snippets = { preset = "luasnip" },

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
