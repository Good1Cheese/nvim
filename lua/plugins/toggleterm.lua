local Plugin = { "akinsho/toggleterm.nvim" }

Plugin.event = "VeryLazy"

function Plugin.config()
    local t = require("toggleterm.terminal").Terminal
    local shell = t:new({ cmd = "zsh", hidden = true })

    function _shell_toggle()
        shell:toggle()
    end

    vim.keymap.set("n", "<leader>t", function() _shell_toggle() end, { desc = "Terminal" })
    vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { noremap = true })
end

return Plugin
