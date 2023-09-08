-- Hint: use `:h <option>` to figure out the meaning if needed
local opt = vim.opt

opt.completeopt = { "menu", "menuone", "noselect" }
opt.clipboard = "unnamedplus" -- use system clipboard
opt.mouse = "a"               -- allow the mouse to be used in Nvim

opt.swapfile = false          -- don't create swap files
opt.undofile = true           -- save undo files

opt.spelllang = { "en" }

-- decrease delays
opt.updatetime = 250
opt.timeoutlen = 100

-- Tab
opt.tabstop = 4      -- number of visual spaces per TAB
opt.softtabstop = 4  -- number of spacesin tab when editing
opt.shiftwidth = 4   -- insert 4 spaces on a tab
opt.expandtab = true -- tabs are spaces, mainly because of python
opt.breakindent = true
opt.smartindent = true


-- UI config
opt.number = true         -- show absolute number
opt.relativenumber = true -- add numbers to each line on the left side
opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
opt.splitbelow = true     -- open new vertical split bottom
opt.splitright = true     -- open new horizontal splits right
opt.termguicolors = true  -- enabl 24-bit RGB color in the TUI
opt.showmode = false      -- we are experienced, wo don"t need the "-- INSERT --" mode hint


-- Searching
opt.incsearch = true  -- search as characters are entered
opt.hlsearch = true   -- do not highlight matches
opt.ignorecase = true -- ignore case in searches by default
opt.smartcase = true  -- but make it case sensitive if an uppercase is enteredopt.smartcase = true
-- but make it case sensitive if an uppercase is entered


-- Highlight yanked text
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

vim.cmd("au BufEnter * set fo-=c fo-=r fo-=o") -- don't auto-comment new lines
