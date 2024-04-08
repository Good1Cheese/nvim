local dap = require("dap")

dap.adapters["local-lua"] = {
    type = "executable",
    command = "node",
    args = {
        vim.env.HOME .. "/.local/state/local-lua-debugger-vscode/extension/debugAdapter.js"
    },
    enrich_config = function(config, on_config)
        if not config["extensionPath"] then
            local c = vim.deepcopy(config)
            -- 💀 If this is missing or wrong you"ll see
            -- "module "lldebugger" not found" errors in the dap-repl when trying to launch a debug session
            c.extensionPath = vim.env.HOME .. "/.local/state/local-lua-debugger-vscode"
            on_config(c)
        else
            on_config(config)
        end
    end,
}

dap.configurations.lua = {
    {
        name = "Current file (local-lua-dbg, lua)",
        type = "local-lua",
        request = "launch",
        cwd = "${workspaceFolder}",
        program = {
            lua = "lua5.1",
            file = "${file}",
        },
        args = {},
    },
}
