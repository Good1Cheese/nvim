require "core.options"
require "core.keymaps"
require "core.commands"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
	require "plugins.autocompletion",
	require "plugins.blankline",
	require "plugins.comment",
	require "plugins.gitsigns",
	require "plugins.bg",
	require "plugins.lsp",
	require "plugins.misc",
	require "plugins.sessionmanager",
	require "plugins.toggleterm",
	require "plugins.whichkey",
	require "plugins.autoformatting",
	require "plugins.colorscheme",
	require "plugins.debug",
	require "plugins.harpoon",
	require "plugins.lualine",
	require "plugins.oil",
	require "plugins.telescope",
	require "plugins.move",
	require "plugins.silicon",
	require "plugins.suda",
	require "plugins.treesitter",
}
