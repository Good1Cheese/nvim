-- Keymap configuration
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- ============================================================================
-- LEADER SETUP
-- ============================================================================
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- GENERAL EDITING
-- ============================================================================
-- Better paste in visual mode (don't yank replaced text)
map("v", "p", "P", opts)
map("v", "Y", "y'>p", opts)

-- Visual mode: $ goes to end but not past line
map("v", "$", "$h", opts)

-- Keep cursor position when joining lines
map("n", "J", "mzJ`z", opts)

-- Disable search highlight
map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- ============================================================================
-- LINE/BLOCK MANIPULATION
-- ============================================================================
-- Duplicate line/selection
map("n", "<C-S-j>", ":copy.<CR>", opts)
map("v", "<C-S-j>", ":copy'<-1<CR>gv", opts)

-- Move lines/blocks up/down
map("n", "<A-j>", ":move .+1<CR>==", opts)
map("n", "<A-k>", ":move .-2<CR>==", opts)
map("v", "<A-j>", ":move '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- Move characters left/right
map("n", "<A-h>", "xhP", opts)
map("n", "<A-l>", "xp", opts)

-- Indent/outdent and maintain selection
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "<A-h>", "<gv", opts)
map("v", "<A-l>", ">gv", opts)

-- ============================================================================
-- NEW LINE CREATION
-- ============================================================================

map("n", "<C-`>", "kA<CR><Esc>j", { desc = "New line above current" })
map("n", "<C-1>", "A<CR><Esc>k", { desc = "New line below, stay current" })
map("n", "<C-2>", "i<CR><Esc>k", { desc = "Break line at cursor" })

-- ============================================================================
-- SAVE OPERATIONS
-- ============================================================================
-- Save current file
map({ "n", "v" }, "<C-s>", "<Cmd>silent! write<CR>", opts)
map({ "n", "v" }, "<C-S-s>", "<Cmd>silent! write<CR>", opts)

-- Save all files from insert mode
map("i", "<C-s>", "<Esc><Cmd>silent! wall<CR>", opts)
map("i", "<C-S-s>", "<Esc><Cmd>silent! wall<CR>", opts)

-- ============================================================================
-- CLIPBOARD OPERATIONS
-- ============================================================================
-- Paste in insert mode
map("i", "<C-v>", "<C-r>+", opts)

-- Select all
map("n", "<C-S-a>", "ggVG", opts)

-- ============================================================================
-- NAVIGATION
-- ============================================================================
-- Better search navigation (center and unfold)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- ============================================================================
-- WINDOW RESIZING
-- ============================================================================
map("n", "<C-Up>", "<Cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<Cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", opts)

-- ============================================================================
-- TERMINAL MODE
-- ============================================================================
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ============================================================================
-- LEARNING AIDS
-- ============================================================================
-- Disable arrow keys to encourage hjkl usage
local arrow_keys = { "<Up>", "<Down>", "<Left>", "<Right>" }
for _, key in ipairs(arrow_keys) do
    map("n", key, "<Cmd>echomsg 'Use hjkl instead!'<CR>", opts)
end
