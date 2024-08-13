local Plugin = { "CRAG666/code_runner.nvim" }

Plugin.cmd = "RunFile"

Plugin.opts = {
	focus = false,
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
