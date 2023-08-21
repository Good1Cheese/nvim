local statusOk, alpha = pcall(require, "alpha")
if not statusOk then return end

local dashboard = require("alpha.themes.dashboard")

local logo = [[
           ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
           ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
           ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
           ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
           ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
           ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

dashboard.section.header.val = vim.split(logo, "\n")

dashboard.section.buttons.val = {
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <cr>"),
    dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <cr>"),
    dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <cr>"),
    dashboard.button("g", " " .. " Find text", ":Telescope live_grep <cr>"),
    dashboard.button("c", " " .. " Config", ":e $MYVIMRC <cr>"),
    dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
    dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<cr>"),
    dashboard.button("q", " " .. " Quit", ":qa<cr>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
end

dashboard.section.footer.val = function() return "Don't know what to say..." end
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
