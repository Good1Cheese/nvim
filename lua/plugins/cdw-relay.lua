return {
    dir = "~/Personal/cdw/cdw-relay.nvim",
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
