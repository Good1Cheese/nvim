local group = vim.api.nvim_create_augroup("user_cmds", { clear = true })

vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {})
vim.api.nvim_create_user_command("LoadSession", [[:lua require("persistence").load({ last = true })<cr>]], {})
vim.api.nvim_create_user_command("DapUIToggle", ":lua require('dapui').toggle()<cr>", {})
vim.api.nvim_create_user_command("DapUIReset", ":lua require('dapui').open({ reset = true })<cr>", {})
vim.api.nvim_create_user_command("RORCommands", ":lua require('ror.commands').list_commands()<cr>", {})
vim.api.nvim_create_user_command("HarpoonList", ":lua require('harpoon'):list():add()<cr>", {})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = group,
	pattern = "*",
})

local map_split = function(buf_id, lhs, direction)
	local rhs = function()
		-- Make new window and set it as target
		local new_target_window
		vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
			vim.cmd(direction .. " split")
			new_target_window = vim.api.nvim_get_current_win()
		end)

		MiniFiles.set_target_window(new_target_window)
	end

	-- Adding `desc` will result into `show_help` entries
	local desc = "Split " .. direction
	vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		-- Tweak keys to your liking
		map_split(buf_id, "<C-s>", "belowright horizontal")
		map_split(buf_id, "<C-v>", "belowright vertical")
	end,
})

-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "MiniFilesWindowOpen",
-- 	callback = function(args)
-- 		local win_id = args.data.win_id
--
-- 		-- vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = "#1f2b36" })
-- 		-- vim.api.nvim_set_hl(0, "MiniFilesBorderModified", { bg = "#1f2b36" })
--
-- 		-- Customize window-local settings
-- 		-- vim.wo[win_id].winblend = 10
-- 		-- vim.api.nvim_win_set_config(win_id)
-- 	end,
-- })

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*.erb", "*.eruby" },
	command = "set syntax=html",
})

-- vim.api.nvim_create_autocmd("FocusGained", {
-- 	pattern = "*",
-- 	group = group,
-- 	command = ":!setxkbmap -layout us && setxkbmap -layout us,ru",
-- })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "man" },
	group = group,
	command = "nnoremap <buffer> q <cmd>quit<cr>",
})
