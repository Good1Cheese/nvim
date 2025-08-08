local Plugin = { "akinsho/toggleterm.nvim" }

Plugin.event = "VimEnter"

function Plugin.config()
    local t = require("toggleterm.terminal").Terminal
    local fish = t:new({ cmd = "fish", hidden = true })

    vim.keymap.set("n", "<leader>t", function() fish:toggle() end, { desc = "Terminal" })
    vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { noremap = true })
end

return Plugin
