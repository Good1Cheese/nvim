local opt = vim.opt
local g = vim.g
local o = vim.o

-- ============================================================================
-- LEADER AND BASIC SETUP
-- ============================================================================

-- Disable netrw; Oil owns filesystem editing and Snacks owns fuzzy discovery.
g.loaded_netrwPlugin = 1

-- Disable unused providers for faster startup.
local disabled_providers = { "node", "perl", "python3", "ruby" }
for _, provider in ipairs(disabled_providers) do
    g["loaded_" .. provider .. "_provider"] = 0
end

-- ============================================================================
-- UI AND DISPLAY
-- ============================================================================

opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.signcolumn = "yes"
opt.cursorline = true
opt.ruler = false
opt.showmode = false

opt.termguicolors = true
opt.winborder = "rounded"
opt.laststatus = 3

o.wrap = true
o.linebreak = true
opt.breakindent = true

opt.splitbelow = true
opt.splitright = true

-- ============================================================================
-- SCROLLING AND NAVIGATION
-- ============================================================================

opt.scrolloff = 8
opt.sidescrolloff = 8
opt.whichwrap:append("<>[]hl")

-- ============================================================================
-- INDENTATION AND TABS
-- ============================================================================

opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.smarttab = true

-- ============================================================================
-- SEARCH SETTINGS
-- ============================================================================

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- ============================================================================
-- FILE HANDLING
-- ============================================================================

opt.swapfile = false
opt.backup = false
opt.undofile = true

local undo_dir = vim.fn.expand("~/.vim/undodir")
vim.fn.mkdir(undo_dir, "p")
opt.undodir = undo_dir

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.spelllang = { "en" }

-- ============================================================================
-- PERFORMANCE AND TIMING
-- ============================================================================

-- 250 ms keeps CursorHold-based plugins responsive without making them run
-- unnecessarily often while typing/navigation is active.
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 100

-- ============================================================================
-- FOLDING
-- ============================================================================

o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- ============================================================================
-- AUTOCOMMANDS
-- ============================================================================

local augroup = vim.api.nvim_create_augroup("OptionsConfig", { clear = true })

-- Disable auto-commenting on new lines.
vim.api.nvim_create_autocmd("BufEnter", {
    group = augroup,
    desc = "Disable auto-commenting",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- ============================================================================
-- KEYBOARD LAYOUT (Russian/Cyrillic support)
-- ============================================================================

vim.cmd([[
  set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
]])

-- ============================================================================
-- DIAGNOSTICS
-- ============================================================================

vim.diagnostic.config({
    virtual_text = { prefix = "" },
    virtual_lines = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅙",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "󰋼",
            [vim.diagnostic.severity.HINT] = "󰌵",
        },
    },
    underline = true,
    update_in_insert = false,
})
