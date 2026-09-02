local main_terminal

local function terminal_running(term)
    if not term or not term:buf_valid() then
        return false
    end

    local job_id = vim.b[term.buf].terminal_job_id
    if not job_id then
        return false
    end

    return vim.fn.jobwait({ job_id }, 0)[1] == -1
end

local function toggle_main_terminal()
    if terminal_running(main_terminal) then
        main_terminal:toggle()
        return
    end

    main_terminal = Snacks.terminal.open(nil, {
        cwd = vim.fn.getcwd(0),
    })
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
        bigfile = { enabled = true },
        indent = { enabled = true },
        rename = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        terminal = {
            shell = { "zsh" },
            win = {
                keys = {
                    term_normal = {
                        "<Esc>",
                        function()
                            vim.cmd("stopinsert")
                        end,
                        mode = "t",
                        desc = "Terminal normal mode",
                    },
                },
            },
        },
        styles = {
            notification = {
                wo = { wrap = true },
            },
        },
    },
    keys = {
        { "<leader>f",  function() Snacks.picker.files() end,              desc = "Find files" },
        { "<leader>s",  function() Snacks.picker.grep() end,               desc = "Live grep" },
        { "<leader>S",  function() Snacks.picker.resume() end,             desc = "Resume picker" },
        { "<leader>n",  function() Snacks.picker.notifications() end,      desc = "Notification History" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end,        desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
        { "<leader>u",  function() Snacks.picker.undo() end,               desc = "Undo History" },
        { "<leader>t",  toggle_main_terminal,                              desc = "Terminal" },
        { "<leader>9c", function() Snacks.picker.colorschemes() end,       desc = "Colorschemes" },
        { "<leader>r",  function() Snacks.rename.rename_file() end,        desc = "Rename File" },
        { "<leader>L",  function() Snacks.lazygit() end,                   desc = "Lazygit" },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "OilActionsPost",
            callback = function(event)
                for _, action in ipairs(event.data.actions or {}) do
                    if action.type == "move" then
                        Snacks.rename.on_rename_file(action.src_url, action.dest_url)
                    end
                end
            end,
        })
    end,
}
