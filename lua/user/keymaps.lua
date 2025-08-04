local opts = {
    noremap = true, -- non-recursive
    silent = true   -- do not show message
}

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Avoid yanking test when pasting
keymap("v", "p", "P", opts)
keymap("v", "Y", "y'>p", opts)

keymap("v", "$", "$h", opts)

-- Make duplicate without copying
keymap("n", "<C-3>", [[ :call setreg('A', [])<cr> | "Ayy"Ap  ]], opts)

keymap("n", "<C-S-j>", "<Cmd>copy.<Cr>", opts)
keymap("v", "<C-S-j>", ":copy.-1<Cr>gv", opts) -- no use <Cmd> in visual

keymap("t", "<esc>", "<C-\\><C-N>", opts)

-- Search selected text
-- keymap("v", "<C-s>", "y:lua require('telescope.builtin').grep_string()<cr><C-r>+", opts)

-- Replace selected text
-- keymap("n", "<C-c>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

-- Paste in insert mode
keymap("i", "<C-v>", "<C-r>+<esc>", opts)

-- Copy all
keymap("n", "<C-S-a>", "ggVG", opts)

-- New line
keymap("n", "<C-`>", "kA<cr><esc>j", opts)
keymap("n", "<C-1>", "A<cr><esc>k", opts)
keymap("n", "<C-2>", "i<cr><esc>k", opts)

-- Leave pos alone
keymap("n", "J", "mzJ`z", opts)

-- vim.keymap.set({ "n", "v" }, "<F3>", function()
--     require("conform").format({
--         lsp_fallback = true,
--         async = false,
--         timeout_ms = 1000
--     })
-- end, { desc = "Format file or range (in visual mode)" })

-- Disable search highlight
keymap("n", "<esc>", ":noh<cr>", opts)

-- Save file/files
keymap("n", "<C-s>", ":silent w!<cr>", opts)
keymap("n", "<C-S-s>", ":silent w!<cr>", opts)
keymap("v", "<C-s>", ":silent w!<cr>", opts)

keymap("i", "<C-s>", "<esc>:silent wall!<cr>", opts)
keymap("i", "<C-S-s>", "<esc>:silent wall!<cr>", opts)

-- Disable arrows
keymap("n", "<up>", ":echomsg 'use hjkl dude'<cr>", opts)
keymap("n", "<down>", ":echomsg 'use hjkl dude'<cr>", opts)
keymap("n", "<left>", ":echomsg 'use hjkl dude'<cr>", opts)
keymap("n", "<right>", ":echomsg 'use hjkl dude'<cr>", opts)

-- Better page navigation
-- keymap("n", "<C-d>", "<C-d>zz", opts)
-- keymap("n", "<C-b>", "<C-b>zz", opts)

-- Better search navigation
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- Left window
keymap("n", "<C-k>", "<C-w>k", opts) -- Up window
keymap("n", "<C-j>", "<C-w>j", opts) -- Down window
keymap("n", "<C-l>", "<C-w>l", opts) -- Right window

-- Resize with arrows
-- delta: 2 lines
keymap("n", "<C-Up>", ":resize -2<cr>", opts)
keymap("n", "<C-Down>", ":resize +2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Hint: start visual mode with the same area as the previous area and the same mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Simpler pure Neovim movement (replaces move.nvim)

-- Move lines up/down in normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

-- Move characters left/right (simplified - just moves cursor)
vim.keymap.set("n", "<A-h>", "xhP", opts) -- Cut char and paste before previous
vim.keymap.set("n", "<A-l>", "xp", opts)  -- Cut char and paste after next

-- Move visual blocks up/down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Move visual blocks left/right (indent/unindent)
vim.keymap.set("v", "<A-h>", "<gv", opts)
vim.keymap.set("v", "<A-l>", ">gv", opts)
