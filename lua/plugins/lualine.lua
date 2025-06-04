return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "ecthelionvi/NeoComposer.nvim" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "cyberdream",
        icons_enabled = true,
        component_separators = "|",
        section_separators = "",
        disabled_filetypes = {
          statusline = { "neo-tree", "", "toggleterm" },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "harpoon2" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
        -- lualine_y = { rec.displaySlots },
        -- lualine_z = { rec.recordingStatus },
      },
    })
  end,
  init = function()
    vim.opt.showmode = false
  end
}
