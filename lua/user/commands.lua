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


vim.api.nvim_create_autocmd("BufRead", {
    desc = "set filetype xml for extension .axaml",
    pattern = "*.axaml",
    callback = function()
        vim.bo.filetype = "xml"
    end,
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

function CopyErrorUnderCursor()
    local bufnr = vim.api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local lnum = cursor_pos[1] - 1 -- Текущая строка (0-based)
    local col = cursor_pos[2]      -- Текущая колонка (0-based)

    -- Получаем все диагностики на текущей строке
    local diagnostics = vim.diagnostic.get(bufnr, { lnum = lnum })
    if #diagnostics == 0 then
        return
    end

    -- Фильтруем диагностики, попадающие под курсор
    local relevant_diags = {}
    for _, diag in ipairs(diagnostics) do
        local end_col = diag.end_col or diag.col
        if diag.col <= col and col <= end_col then
            table.insert(relevant_diags, diag)
        end
    end
    if #relevant_diags == 0 then
        return
    end

    -- Копируем сообщение первой найденной диагностики
    local message = relevant_diags[1].message
    vim.fn.setreg("+", message) -- Копируем в системный буфер
    vim.notify("Скопировано: " .. message, vim.log.levels.INFO)
end

-- Настройка горячей клавиши (например <leader>e)
vim.keymap.set("n", "<leader>b", CopyErrorUnderCursor, { desc = "Copy error under cursor" })
