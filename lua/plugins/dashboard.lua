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

Plugin.opts = {
	header = art,
	directories = {
		"~/.config/nvim",
		"~/Projects",
	},
	buttons = {
		{ "s", " " .. "Restore Session", [[:lua require("persistence").load() <cr>]] },
	},
}

return Plugin
