return {
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",
  dependencies = {
    -- Snippet Engine
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/" }
          end,
        },
      },
      opts = {},
    },
    "folke/lazydev.nvim",
    "mikavilpas/blink-ripgrep.nvim",
    "folke/snacks.nvim",
    { "echasnovski/mini.icons", opts = {} },
  },
  opts = {
    -- "default" (recommended) for mappings similar to built-in completions (C-y to accept)
    -- "super-tab" for mappings similar to vscode (tab to accept)
    -- "enter" for enter to accept
    -- "none" for no mappings
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
      -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font"
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "normal",
    },

    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      trigger = {
        show_on_keyword = true,
        show_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
      },
      accept = {
        -- Write completions to the `.` register
        dot_repeat = true,
        -- Create an undo point when accepting a completion item
        create_undo_point = true,
        -- How long to wait for the LSP to resolve the item with additional information before continuing as-is
        resolve_timeout_ms = 100,
        -- Experimental auto-brackets support
        auto_brackets = {
          -- Whether to auto-insert brackets for functions
          enabled = true,
          -- Default brackets to use for unknown languages
          default_brackets = { '(', ')' },
          -- Overrides the default blocked filetypes
          override_brackets_for_filetypes = {},
          -- Synchronously use the kind of the item to determine if brackets should be added
          kind_resolution = {
            enabled = true,
            blocked_filetypes = { 'typescriptreact', 'javascriptreact', 'vue' },
          },
          -- Asynchronously use semantic token to determine if brackets should be added
          semantic_token_resolution = {
            enabled = true,
            blocked_filetypes = { 'java' },
            -- How long to wait for semantic tokens to return before assuming no brackets should be added
            timeout_ms = 400,
          },
        },
      },
      menu = {
        draw = {
          treesitter = { 'lsp' },
          columns = { { 'kind_icon', 'label', 'label_description', gap = 1 }, { 'source_name' } },
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                return kind_icon
              end,
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end,
            },
            kind = {
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end,
            },
            -- label_description = {
            --   text = function(ctx)
            --     -- Возьмем данные из `detail` или другого поля completion_item
            --     return ctx.label_detail
            --   end,
            --   highlight = 'Comment', -- Опционально: задайте подсветку
            -- },
          },
        },
      },
    },
  },

  sources = {
    default = { "lsp", "path", "snippets", "lazydev", "ripgrep", "buffer" },
    providers = {
      lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
      ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        opts = {
          prefix_min_len = 3,
          context_size = 5,
          project_root_marker = ".git",

          -- Enable fallback to neovim cwd if project_root_marker is not
          -- found. Default: `true`, which means to use the cwd.
          project_root_fallback = true,
          search_casing = "--ignore-case",
          additional_rg_options = {},
          fallback_to_regex_highlighting = true,
          ignore_paths = {},
          additional_paths = {},

          -- Keymaps to toggle features on/off. This can be used to alter
          -- the behavior of the plugin without restarting Neovim. Nothing
          -- is enabled by default. Requires folke/snacks.nvim.
          toggles = {
            -- The keymap to toggle the plugin on and off from blink
            -- completion results. Example: "<leader>tg"
            on_off = nil,
          },

          -- Features that are not yet stable and might change in the future.
          -- You can enable these to try them out beforehand, but be aware
          -- that they might change. Nothing is enabled by default.
          future_features = {
            backend = {
              -- The backend to use for searching. Defaults to "ripgrep".
              -- Available options:
              -- - "ripgrep", always use ripgrep
              -- - "gitgrep", always use git grep
              -- - "gitgrep-or-ripgrep", use git grep if possible, otherwise
              --   ripgrep
              use = "ripgrep",
            },
          },

          -- Show debug information in `:messages` that can help in
          -- diagnosing issues with the plugin.
          debug = false,
        },

        -- (optional) customize how the results are displayed. Many options
        -- are available - make sure your lua LSP is set up so you get
        -- autocompletion help
        -- transform_items = function(_, items)
        --   for _, item in ipairs(items) do
        --     -- example: append a description to easily distinguish rg results
        --     item.labelDetails = {
        --       description = "(rg)",
        --     }
        --   end
        --   return items
        -- end,
      },
      lsp = {
        score_offset = 200, -- Максимальный приоритет для LSP
      },
      buffer = {
        score_offset = -50, -- Понижаем вес buffer
      },
    },
  },

  snippets = { preset = "luasnip" },

  -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
  -- which automatically downloads a prebuilt binary when enabled.
  --
  -- By default, we use the Lua implementation instead, but you may enable
  -- the rust implementation via `"prefer_rust_with_warning"`
  --
  -- See :h blink-cmp-config-fuzzy for more information
  fuzzy = {
    implementation = "prefer_rust_with_warning",
    sorts = {
      "exact",
      "score",
      "sort_text",
    },
  },

  cmdline = {
    enabled = true,
    keymap = { preset = "default" },
    completion = {
      trigger = {
        show_on_blocked_trigger_characters = {},
        show_on_x_blocked_trigger_characters = {},
      },
      list = {
        selection = {
          -- When `true`, will automatically select the first item in the completion list
          preselect = true,
          -- When `true`, inserts the completion item automatically when selecting it
          auto_insert = true,
        },
      },
      -- Whether to automatically show the window when new completion items are available
      menu = { auto_show = false },
      -- Displays a preview of the selected item on the current line
      ghost_text = { enabled = true },
    },
  },

  -- Shows a signature help window while you type arguments for a function
  signature = { enabled = true },
  -- ghost_text = { enabled = true },
}
