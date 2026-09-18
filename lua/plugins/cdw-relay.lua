local cdw_relay_dir = vim.fn.expand("~/Projects/cdw/cdw-relay.nvim")

local function dir_exists(path)
    local stat = vim.uv.fs_stat(path)
    return stat and stat.type == "directory"
end

if not dir_exists(cdw_relay_dir) then
    return {}
end

return {
    dir = cdw_relay_dir,
    cmd = {
        "CdwDashboard",
        "CdwOpen",
        "CdwLogin",
        "CdwLogout",
        "CdwFetch",
        "CdwTasks",
        "CdwTest",
        "CdwSubmit",
        "CdwRefresh",
    },
    config = function()
        require("cdw_relay").setup()
    end,
}
