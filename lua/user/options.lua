local opt = vim.opt
local g = vim.g
local o = vim.o

-- ============================================================================
-- LEADER AND BASIC SETUP
-- ============================================================================

-- Disable default file explorer (we'll use oil/telescope instead)
g.loaded_netrwPlugin = 1

-- Disable unused providers for faster startup
local disabled_providers = { "node", "perl", "python3" }
for _, provider in ipairs(disabled_providers) do
    g["loaded_" .. provider .. "_provider"] = 0
end

-- ============================================================================
-- UI AND DISPLAY
-- ============================================================================

-- Line numbers and display
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.signcolumn = "yes"
opt.cursorline = true
opt.ruler = false
opt.showmode = false -- Don't show mode in command line (using statusline)

-- Colors and appearance
opt.termguicolors = true
opt.laststatus = 3 -- Global statusline

-- Text wrapping
o.wrap = true
o.linebreak = true -- Break lines at word boundaries
opt.breakindent = true

-- Window splitting
opt.splitbelow = true
opt.splitright = true

-- ============================================================================
-- SCROLLING AND NAVIGATION
-- ============================================================================

opt.scrolloff = 8     -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Allow cursor to move to next/previous line
opt.whichwrap:append("<>[]hl")

-- ============================================================================
-- INDENTATION AND TABS
-- ============================================================================

opt.expandtab = false -- Use actual tabs
opt.tabstop = 4       -- Tab width
opt.shiftwidth = 4    -- Indent width
opt.smartindent = true
opt.smarttab = true

-- ============================================================================
-- SEARCH SETTINGS
-- ============================================================================

opt.hlsearch = false  -- Don't highlight search results
opt.incsearch = true  -- Show search matches as you type
opt.ignorecase = true -- Ignore case in searches
opt.smartcase = true  -- Case-sensitive if uppercase letters used

-- ============================================================================
-- FILE HANDLING
-- ============================================================================

-- Backup and undo
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Clipboard
opt.clipboard = "unnamedplus"

-- Mouse support
opt.mouse = "a"

-- Spell checking
opt.spelllang = { "en" }

-- ============================================================================
-- PERFORMANCE AND TIMING
-- ============================================================================

opt.updatetime = 50  -- Faster completion and diagnostic updates
opt.timeout = true
opt.timeoutlen = 100 -- Time to wait for mapped sequence

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

-- Remove readonly flag when entering buffers
vim.api.nvim_create_autocmd("BufEnter", {
    group = augroup,
    desc = "Remove readonly flag",
    callback = function()
        vim.bo.readonly = false
    end,
})

-- Disable auto-commenting on new lines
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

-- Map Russian keyboard layout to English for Vim commands
vim.cmd([[
  set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
]])

-- ============================================================================
-- DIAGNOSTICS CONFIGURATION
-- ============================================================================

vim.diagnostic.config({
    -- Use the default configuration
    virtual_lines = false

    -- Alternatively, customize specific options

    -- virtual_lines = {
    --  -- Only show virtual line diagnostics for the current cursor line
    --  current_line = true,
    -- },
})

-- ============================================================================
-- LSP DIAGNOSTIC SIGNS
-- ============================================================================

local function set_diagnostic_sign(name, icon)
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl
    })
end

set_diagnostic_sign("Error", "󰅙")
set_diagnostic_sign("Warn", "")
set_diagnostic_sign("Info", "󰋼")
set_diagnostic_sign("Hint", "󰌵")
