local Plugin = { "akinsho/toggleterm.nvim" }

Plugin.event = "VeryLazy"

function Plugin.config()
    local t = require("toggleterm.terminal").Terminal
    local fish = t:new({ cmd = "fish", hidden = true })

    function _fish_toggle()
        fish:toggle()
    end

    vim.keymap.set("n", "<leader>t", function() _fish_toggle() end, { desc = "Terminal" })
    vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { noremap = true })
end

return Plugin
