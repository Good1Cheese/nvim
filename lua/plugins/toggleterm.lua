local Plugin = { "akinsho/toggleterm.nvim" }

Plugin.cmd = "ReloadNIX"

function Plugin.config()
    local Terminal = require("toggleterm.terminal").Terminal
    local nix = Terminal:new({
        cmd = "sudo nixos-rebuild switch"
    })

    function toggleNIX()
        nix:toggle()
    end

    vim.api.nvim_create_user_command("ReloadNIX", [[ :lua toggleNIX() ]], {})
end
return Plugin
