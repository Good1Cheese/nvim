local Plugin = { "hinell/duplicate.nvim" }

-- Plugin.cmd = { "VisualDuplicate", "LineDuplicate" }
Plugin.event = "VeryLazy"

function Plugin.config()
	vim.keymap.set({ "v" }, "<C-S-j>", ":VisualDuplicate +2<cr>")
	vim.keymap.set({ "n" }, "<C-S-j>", ":LineDuplicate +1<cr>")
end

return Plugin
