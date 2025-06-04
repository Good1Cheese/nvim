return {
  "Shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  dependencies = { "scottmckendry/cyberdream.nvim" },
  config = function(_, opts)
    vim.cmd.colorscheme("ayu")
  end,
}
