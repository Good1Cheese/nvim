-- Minimal Arduino-Nvim setup for LazyVim
return {
    "yuukiflow/Arduino-Nvim",
    dir = "/home/frut/Personal/arduino/Arduino-Nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "neovim/nvim-lspconfig",
    },
    ft = "arduino",
    config = function()
        -- Set up LSP configuration (registers it)
        require("Arduino-Nvim.lsp").setup()

        -- Keymaps
        local map = vim.keymap.set
        map("n", "<Leader>au", ":InoUpload<CR>", { silent = true, desc = "Arduino: Upload code" })
        map("n", "<Leader>ac", ":InoCheck<CR>", { silent = true, desc = "Arduino: Compile/check code" })
        map("n", "<Leader>as", ":InoStatus<CR>", { silent = true, desc = "Arduino: Show status" })
        map("n", "<Leader>ag", ":InoGUI<CR>", { silent = true, desc = "Arduino: Open GUI" })
        map("n", "<Leader>am", ":InoMonitor<CR>", { silent = true, desc = "Arduino: Serial monitor" })
        map("n", "<Leader>al", ":InoLib<CR>", { silent = true, desc = "Arduino: Library" })
        map("n", "<Leader>ab", ":InoSelectBoard<CR>", { silent = true, desc = "Arduino: Select board" })
        map("n", "<Leader>ap", ":InoSelectPort<CR>", { silent = true, desc = "Arduino: Select port" })
        map("n", "<Leader>ar", ":InoUploadReset<CR>", { silent = true, desc = "Arduino: Upload with reset" })

        vim.api.nvim_create_autocmd("BufReadPost", {
            pattern = "*.ino",
            callback = function()
                vim.bo.filetype = "arduino"
                require("Arduino-Nvim")
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "arduino",
            callback = function()
                require("Arduino-Nvim")
                vim.lsp.start({
                    name = "arduino_language_server",
                    cmd = {
                        "arduino-language-server",
                        "-cli", "arduino-cli",
                        "-cli-config", vim.fn.expand("$HOME/.arduino15/arduino-cli.yaml"),
                        "-clangd", vim.fn.exepath("clangd"),
                        "-fqbn", require("Arduino-Nvim").board,
                    },
                })
            end,
        })
    end,
}
