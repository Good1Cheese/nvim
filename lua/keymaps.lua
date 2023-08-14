local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-----------------
-- Normal mode --
-----------------

keymap("n", "<C-h>", "<C-w>h", opts)              -- Left window
keymap("n", "<C-k>", "<C-w>k", opts)              -- Up window
keymap("n", "<C-j>", "<C-w>j", opts)              -- Down window
keymap("n", "<C-l>", "<C-w>l", opts)              -- Right window

keymap("n", "<tab>", ":bnext<cr>", opts)          -- Next Tab
keymap("n", "<s-tab>", ":bprevious<cr>", opts)    -- Previous tab
keymap("n", "<leader>h", ":nohlsearch<cr>", opts) -- No highlight search

-- Resize with arrows
-- delta: 2 lines
keymap("n", "<C-Up>", ":resize -2<cr>", opts)
keymap("n", "<C-Down>", ":resize +2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

keymap("n", "f", "i<cr><Esc>", {})

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
