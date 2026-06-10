local cdw_relay_dir = vim.fn.expand("~/Personal/cdw/cdw-relay.nvim")

local function dir_exists(path)
    local stat = (vim.uv or vim.loop).fs_stat(path)
    return stat and stat.type == "directory"
end

if not dir_exists(cdw_relay_dir) then
    return {}
end

return {
    dir = cdw_relay_dir,
    cmd = {
        "CdwOpen",
        "CdwLogin",
        "CdwLogout",
        "CdwFetch",
        "CdwTest",
        "CdwSubmit",
        "CdwRefresh",
    },
    config = function()
        require("cdw_relay").setup()
    end,
}
