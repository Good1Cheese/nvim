local Plugin = { "MeanderingProgrammer/dashboard.nvim" }

Plugin.event = "VimEnter"

local art = {
	"           .'\\   /`.          ",
	"         .'.-.`-'.-.`.         ",
	"    ..._:   .-. .-.   :_...    ",
	"  .'    '-.(o ) (o ).-'    `.  ",
	" :  _    _ _`~(_)~`_ _    _  : ",
	":  /:   ' .-=_   _=-. `   ;\\  :",
	":   :|-.._  '     `  _..-|:   :",
	" :   `:| |`:-:-.-:-:'| |:'   : ",
	"  `.   `.| | | | | | |.'   .'  ",
	"    `.   `-:_| | |_:-'   .'    ",
	"      `-._   ````    _.-'      ",
	"          ``-------''          ",
	"",
	"",
	"",
}

function Plugin.config()
	require("dashboard").setup({
		header = art,
		directories = {
			"~/.config/nvim",
			"~/Projects",
		},
		buttons = {
			{ "s", " " .. "Restore Session", [[:lua require("persistence").load() <cr>]] },
		},
	})
end

return Plugin
