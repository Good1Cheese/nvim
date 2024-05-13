local Plugin = { "folke/persistence.nvim" }

-- Plugin.event = "VeryLazy"
Plugin.event = "BufReadPre"
-- Plugin.cmd = "LoadSession"

Plugin.config = true

return Plugin
