local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Normal-mode commands
keymap("n", "<A-j>", ":MoveLine(1)<cr>", opts)
keymap("n", "<A-k>", ":MoveLine(-1)<cr>", opts)
keymap("n", "<A-h>", ":MoveHChar(-1)<cr>", opts)
keymap("n", "<A-l>", ":MoveHChar(1)<cr>", opts)
-- keymap("n", "<leader>wf", ":MoveWord(1)<cr>", opts)
-- keymap("n", "<leader>wb", ":MoveWord(-1)<cr>", opts)

-- Visual-mode commands
keymap("v", "<A-j>", ":MoveBlock(1)<cr>", opts)
keymap("v", "<A-k>", ":MoveBlock(-1)<cr>", opts)
keymap("v", "<A-h>", ":MoveHBlock(-1)<cr>", opts)
keymap("v", "<A-l>", ":MoveHBlock(1)<cr>", opts)
