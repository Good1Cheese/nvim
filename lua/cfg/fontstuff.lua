require("fontsize").init({
	font = "JetBrainsMono Nerd Font",

	min = 6,
	default = 12,
	max = 24,
	step = 1,
})

local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}

vim.api.nvim_set_keymap("n", "<C-->", ":FontDecrease<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-=>", ":FontIncrease<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-+>", ":FontIncrease<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-0>", ":FontReset<cr>", opts)
