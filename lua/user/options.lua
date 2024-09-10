-- Hint: use `:h <option>` to figure out the meaning if needed
local opt = vim.opt

-- opt.guicursor = ""
vim.cmd("set eventignore=BufWritePost,VimResized")
vim.cmd("au BufEnter * set noro")
-- vim.cmd("let g:sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.so'")

vim.g.loaded_netrwPlugin = 0

opt.sidescrolloff = 8 -- Columns of context
opt.scrolloff = 8 -- Lines of context

opt.wrap = false

opt.clipboard = "unnamedplus" -- use system clipboard
opt.mouse = "a" -- allow the mouse to be used in Nvim

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim.undodir"

opt.spelllang = { "en" }

-- Folds
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- decrease delays
opt.updatetime = 50
opt.timeout = true
opt.timeoutlen = 100

-- Tab
opt.expandtab = false -- tabs are spaces, mainly because of python
opt.shiftwidth = 4 -- insert 4 spaces on a tab
opt.tabstop = 4 -- number of visual spaces per TAB
opt.breakindent = true
opt.smartindent = true
opt.smarttab = true

-- opt.pumheigth = 10

-- UI config
opt.number = true -- show absolute number
opt.numberwidth = 2
opt.ruler = false

opt.relativenumber = true -- add numbers to each line on the left side
opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
opt.splitbelow = true -- open new vertical split bottom
opt.splitright = true -- open new horizontal splits right
opt.termguicolors = true -- enabl 24-bit RGB color in the TUI
opt.showmode = false -- we are experienced, wo don"t need the "-- INSERT --" mode hint

-- Searching
opt.incsearch = true -- search as characters are entered
opt.hlsearch = false -- do not highlight matches
opt.incsearch = true
opt.ignorecase = true -- ignore case in searches by default
opt.smartcase = true -- but make it case sensitive if an uppercase is enteredopt.smartcase = true
-- but make it case sensitive if an uppercase is entered

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
vim.cmd("au BufEnter * set fo-=c fo-=r fo-=o") -- don't auto-comment new lines

-- disable some default providers
for _, provider in ipairs({
	"node",
	"perl",
	"python3", --[[ "ruby" ]]
}) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
})

local function lspSymbol(name, icon)
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "󰅙")
lspSymbol("Info", "󰋼")
lspSymbol("Hint", "󰌵")
lspSymbol("Warn", "")
