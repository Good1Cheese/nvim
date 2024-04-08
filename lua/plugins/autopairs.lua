local Plugin = { "windwp/nvim-autopairs" }

Plugin.event = "InsertEnter"

function Plugin.config()
	local cmp = require("cmp")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

Plugin.opts = {
	enable_check_bracket_line = false,
}

return Plugin
