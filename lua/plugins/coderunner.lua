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

		-- as hello_baeldung_att.asm -o hello_baeldung_att.o && ld -s -o hello_baeldung_att hello_baeldung_at
		-- t.o && ./hello_baeldung_att

		asm = {
			"cd $dir &&",
			"as $fileName -o /tmp/$fileNameWithoutExt.o &&",
			"ld -s -o /tmp/$fileNameWithoutExt /tmp/$fileNameWithoutExt.o &&",
			"/tmp/$fileNameWithoutExt",
		},

		s = {
			"cd $dir &&",
			"gcc $fileName",
			"-nostdlib -static",
			"-o /tmp/$fileNameWithoutExt &&",
			"/tmp/$fileNameWithoutExt",
		},
		lua = {
			"cd $dir &&",
			"lua $fileName",
		},
		sh = {
			"cd $dir &&",
			"bash $fileName",
		},
		ruby = function()
			-- local file = vim.fn.expand("%")
			-- if string.find(file, "test") then
			-- 	return "rspec $file"
			-- end
			return "cd $dir && ruby $fileName"
		end,
	},
}

return Plugin
