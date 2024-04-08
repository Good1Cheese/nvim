local Plugin = { "michaelrommel/nvim-silicon" }

Plugin.cmd = "Silicon"

function Plugin.config()
	local wk = require("which-key")
	wk.register({
		["s"] = { ":Silicon<cr>", "Make screenshot" },
	}, { mode = "v" })
end

Plugin.opts = {
	font = "JetBrainsMono Nerd Font=35;Noto Color Emoji=34",
	theme = "Coldark-Dark",
	-- background = "#000001",
	to_clipboard = true,
	no_line_number = true,
	output = function()
		return "./" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
	end,
}

return Plugin
