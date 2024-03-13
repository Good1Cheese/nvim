local cmp = require("cmp")
local autopairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

autopairs.setup({
	enable_check_bracket_line = false,
})
