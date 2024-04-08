local Plugin = { "rcarriga/nvim-notify" }

Plugin.opts = {
	fps = 75,
	max_height = 15,
	max_width = 200,
	render = "minimal",
	stages = "slide",
	-- timeout = 300,
	top_down = false,
}

return Plugin
