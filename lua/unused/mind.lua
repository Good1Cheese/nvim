return {
	"phaazon/mind.nvim",
	cmd = "MindOpenMain",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require "mind".setup()
	end
}
