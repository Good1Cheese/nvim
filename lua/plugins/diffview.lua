return {
    -- The maintained fork was renamed from diffview.nvim to diffview-plus.nvim.
    -- Keep the lazy.nvim plugin name stable so the existing lock entry remains valid.
    "dlyongemallo/diffview-plus.nvim",
    name = "diffview.nvim",
    version = "*",
    cmd = {
        "DiffviewOpen",
        "DiffviewToggle",
        "DiffviewFileHistory",
        "DiffviewDiffFiles",
        "DiffviewMergeFiles",
        "DiffviewDiffDirs",
    },
}
