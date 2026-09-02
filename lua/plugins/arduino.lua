local arduino_dir = vim.fn.expand("~/Personal/arduino/Arduino-Nvim")

local stat = vim.uv.fs_stat(arduino_dir)
if not stat or stat.type ~= "directory" then
    return {}
end

return {
    "yuukiflow/Arduino-Nvim",
    dir = arduino_dir,
    ft = "arduino",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local ok_lsp, arduino_lsp = pcall(require, "Arduino-Nvim.lsp")
        if ok_lsp then
            arduino_lsp.setup()
        else
            vim.notify("Arduino-Nvim LSP setup failed: " .. tostring(arduino_lsp), vim.log.levels.WARN)
        end

        local ok, arduino = pcall(require, "Arduino-Nvim")
        if not ok then
            vim.notify("Arduino-Nvim failed to load: " .. tostring(arduino), vim.log.levels.WARN)
            return
        end

        local map = vim.keymap.set
        local opts = { silent = true }
        map("n", "<Leader>au", "<Cmd>InoUpload<CR>", vim.tbl_extend("force", opts, { desc = "Arduino: Upload" }))
        map("n", "<Leader>ac", "<Cmd>InoCheck<CR>", vim.tbl_extend("force", opts, { desc = "Arduino: Check" }))
        map("n", "<Leader>as", "<Cmd>InoStatus<CR>", vim.tbl_extend("force", opts, { desc = "Arduino: Status" }))
        map("n", "<Leader>ag", "<Cmd>InoGUI<CR>", vim.tbl_extend("force", opts, { desc = "Arduino: GUI" }))
        map("n", "<Leader>am", "<Cmd>InoMonitor<CR>", vim.tbl_extend("force", opts, { desc = "Arduino: Monitor" }))
        map("n", "<Leader>al", "<Cmd>InoLib<CR>", vim.tbl_extend("force", opts, { desc = "Arduino: Library" }))
        map("n", "<Leader>ab", "<Cmd>InoSelectBoard<CR>", vim.tbl_extend("force", opts, { desc = "Arduino: Board" }))
        map("n", "<Leader>ap", "<Cmd>InoSelectPort<CR>", vim.tbl_extend("force", opts, { desc = "Arduino: Port" }))
        map("n", "<Leader>ar", "<Cmd>InoUploadReset<CR>", vim.tbl_extend("force", opts, { desc = "Arduino: Upload reset" }))

        -- Arduino-Nvim owns its filetype/LSP lifecycle. Do not create another
        -- BufReadPost autocmd or start a duplicate language-server client here.
        _ = arduino
    end,
}
