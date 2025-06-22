local group = vim.api.nvim_create_augroup("user_cmds", { clear = true })

vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {})
vim.api.nvim_create_user_command("LoadSession", [[:lua require("persistence").load({ last = true })<cr>]], {})
vim.api.nvim_create_user_command("DapUIToggle", ":lua require('dapui').toggle()<cr>", {})
vim.api.nvim_create_user_command("DapUIReset", ":lua require('dapui').open({ reset = true })<cr>", {})
vim.api.nvim_create_user_command("RORCommands", ":lua require('ror.commands').list_commands()<cr>", {})
vim.api.nvim_create_user_command("HarpoonList", ":lua require('harpoon'):list():add()<cr>", {})
vim.api.nvim_create_user_command("TypstPreview", ":lua require('typst-preview').preview()<cr>", {})
vim.api.nvim_create_user_command("ActionPreview", ":lua require('actions-preview').code_actions()<cr>", {})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = group,
	pattern = "*",
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
