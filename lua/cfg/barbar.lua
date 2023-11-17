local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<Tab>", ":BufferNext<cr>", opts)
map("n", "<S-Tab>", ":BufferPrevious<cr>", opts)
-- Re-order to previous/next
map("n", "<A-,>", ":BufferMovePrevious<cr>", opts)
map("n", "<A-.>", ":BufferMoveNext<cr>", opts)
-- Goto buffer in position...
map("n", "<A-1>", ":BufferGoto 1<cr>", opts)
map("n", "<A-2>", ":BufferGoto 2<cr>", opts)
map("n", "<A-3>", ":BufferGoto 3<cr>", opts)
map("n", "<A-4>", ":BufferGoto 4<cr>", opts)
map("n", "<A-5>", ":BufferGoto 5<cr>", opts)
map("n", "<A-6>", ":BufferGoto 6<cr>", opts)
map("n", "<A-7>", ":BufferGoto 7<cr>", opts)
map("n", "<A-8>", ":BufferGoto 8<cr>", opts)
map("n", "<A-9>", ":BufferGoto 9<cr>", opts)
map("n", "<A-0>", ":BufferLast<cr>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", ":BufferPin<cr>", opts)
-- Close buffer
map("n", "<C-c>", ":BufferClose!<cr>", opts)
map("n", "<C-x>", ":BufferCloseAllButCurrentOrPinned<cr>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", ":BufferPick<cr>", opts)
-- Sort automatically by...
-- map("n", "<Space>bb", ":BufferOrderByBufferNumber<cr>", opts)
-- map("n", "<Space>bd", ":BufferOrderByDirectory<cr>", opts)
-- map("n", "<Space>bl", ":BufferOrderByLanguage<cr>", opts)
-- map("n", "<Space>bw", ":BufferOrderByWindowNumber<cr>", opts)
