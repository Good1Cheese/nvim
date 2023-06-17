local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Normal-mode commands
keymap( "n", "<A-Down>", ":MoveLine(1)<CR>", opts )
keymap( "n", "<A-Up>", ":MoveLine(-1)<CR>", opts )
keymap( "n", "<A-h>", ":MoveHChar(-1)<CR>", opts )
keymap( "n", "<A-l>", ":MoveHChar(1)<CR>", opts )
keymap( "n", "<leader>wf", ":MoveWord(1)<CR>", opts )
keymap( "n", "<leader>wb", ":MoveWord(-1)<CR>", opts )

-- Visual-mode commands
keymap( "v", "<A-Down>", ":MoveBlock(1)<CR>", opts )
keymap( "v", "<A-Up>", ":MoveBlock(-1)<CR>", opts )
keymap( "v", "<A-h>", ":MoveHBlock(-1)<CR>", opts )
keymap( "v", "<A-l>", ":MoveHBlock(1)<CR>", opts )
