-- ============================================================================
-- AUTOCOMMAND GROUP
-- ============================================================================
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- ============================================================================
-- AUTOCMDS
-- ============================================================================


vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "rs", "svelte", "js", "mod", "sum", "csv", "sql" },
	callback = function() vim.treesitter.start() end,
})

-- sudo write
vim.api.nvim_create_user_command("Suw", function()
	local filepath = vim.fn.expand("%:p")
	if filepath == "" then
		vim.notify("E32: No file name", vim.log.levels.ERROR)
		return
	end
	-- Save buffer to a temporary file
	local tmpfile = vim.fn.tempname()
	vim.cmd("write! " .. tmpfile)
	-- Prompt for password
	vim.fn.inputsave()
	local password = vim.fn.inputsecret("Password: ")
	vim.fn.inputrestore()
	if password == "" then
		vim.notify("Invalid password, sudo aborted", vim.log.levels.WARN)
		return
	end
	-- Use sudo to move the file
	local cmd = string.format("sudo -p '' -S dd if=%s of=%s bs=1048576",
		vim.fn.shellescape(tmpfile), vim.fn.shellescape(filepath)
	)
	local proc = vim.system({ "sh", "-c", string.format("echo %q | %s", password, cmd) }):wait()
	-- Handle result
	if proc.code == 0 then
		vim.bo.modified = false
		vim.cmd.checktime()
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", true
		)
	else
		vim.notify(proc.stderr, vim.log.levels.ERROR)
	end

	vim.fn.delete(tmpfile)
end, { desc = "Sudo write current buffer" })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	desc = "Highlight yanked text",
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

-- Set XML filetype for .axaml files
vim.api.nvim_create_autocmd("BufRead", {
	group = augroup,
	desc = "Set XML filetype for .axaml files",
	pattern = "*.axaml",
	callback = function()
		vim.bo.filetype = "xml"
	end,
})

-- Quick quit for help and man pages
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	desc = "Quick quit for help and man pages",
	pattern = { "help", "man", "qf", "lspinfo" },
	callback = function(event)
		vim.keymap.set("n", "q", "<Cmd>quit<CR>", {
			buffer = event.buf,
			silent = true,
			desc = "Quick quit"
		})
	end,
})

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

-- Copy diagnostic message under cursor
local function copy_diagnostic_under_cursor()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local lnum = cursor_pos[1] - 1 -- Current line (0-based)
	local col = cursor_pos[2]      -- Current column (0-based)

	-- Get all diagnostics on current line
	local diagnostics = vim.diagnostic.get(bufnr, { lnum = lnum })
	if #diagnostics == 0 then
		vim.notify("No diagnostics found on current line", vim.log.levels.WARN)
		return
	end

	-- Filter diagnostics under cursor
	local relevant_diags = {}
	for _, diag in ipairs(diagnostics) do
		local start_col = diag.col or 0
		local end_col = diag.end_col or start_col
		if start_col <= col and col <= end_col then
			table.insert(relevant_diags, diag)
		end
	end

	if #relevant_diags == 0 then
		-- If no diagnostic exactly under cursor, use the first one on the line
		relevant_diags = { diagnostics[1] }
	end

	-- Copy message to system clipboard
	local message = relevant_diags[1].message
	vim.fn.setreg("+", message)
	vim.notify("Copied: " .. message:gsub("\n", " "), vim.log.levels.INFO)
end

-- ============================================================================
-- KEYMAPS FOR UTILITY FUNCTIONS
-- ============================================================================
vim.keymap.set("n", "<leader>b", copy_diagnostic_under_cursor, {
	desc = "Copy diagnostic under cursor"
})

-- Alternative: Copy all diagnostics on current line
vim.keymap.set("n", "<leader>B", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
	local diagnostics = vim.diagnostic.get(bufnr, { lnum = lnum })

	if #diagnostics == 0 then
		vim.notify("No diagnostics on current line", vim.log.levels.WARN)
		return
	end

	local messages = {}
	for _, diag in ipairs(diagnostics) do
		table.insert(messages, diag.message)
	end

	local combined = table.concat(messages, " | ")
	vim.fn.setreg("+", combined)
	vim.notify("Copied " .. #diagnostics .. " diagnostic(s)", vim.log.levels.INFO)
end, { desc = "Copy all diagnostics on line" })
