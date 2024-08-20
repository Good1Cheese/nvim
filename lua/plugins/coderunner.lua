local Plugin = { "CRAG666/code_runner.nvim" }

Plugin.cmd = "RunFile"

Plugin.opts = {
	mode = "float",
	focus = false,
	float = {
		close_key = "<ESC>",
		-- Window border (see ':h nvim_open_win')
		border = "single",

		-- Num from `0 - 1` for measurements
		height = 1,
		width = 0.8,
		x = 0.5,
		y = 0.5,

		-- Highlight group for floating window/border (see ':h winhl')
		border_hl = "FloatBorder",
		float_hl = "Normal",

		-- Transparency (see ':h winblend')
		blend = 0,
	},
	filetype = {
		cpp = {
			"cd $dir &&",
			"g++ $fileName",
			"-o /tmp/$fileNameWithoutExt &&",
			"/tmp/$fileNameWithoutExt",
		},
		c = function()
			local file = vim.fn.expand("%")
			if string.find(file, "*dism") then
				return {
					"cd $dir &&",
					"gcc $fileName",
					"-o $fileNameWithoutExt",
				}
			end

			if string.find(file, "tests") then
				return {
					"cd $dir &&",
					"gcc -std=c18 -Wall -Wextra -lcriterion",
					"$fileName solution.c",
					"-o /tmp/$fileNameWithoutExt &&",
					"/tmp/$fileNameWithoutExt",
				}
			end

			return {
				"cd $dir &&",
				"gcc $fileName",
				"-o /tmp/$fileNameWithoutExt &&",
				"/tmp/$fileNameWithoutExt",
			}
		end,
		asm = {
			"cd $dir &&",
			"nasm -f elf64 $fileName -o /tmp/$fileNameWithoutExt.o &&",
			"ld -s -o /tmp/$fileNameWithoutExt /tmp/$fileNameWithoutExt.o &&",
			"/tmp/$fileNameWithoutExt",
		},
		lua = "cd $dir && lua $fileName",
		rb = "cd $dir && ruby $fileName",
	},
}

return Plugin
