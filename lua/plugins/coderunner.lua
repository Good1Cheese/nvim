local Plugin = { "CRAG666/code_runner.nvim" }

Plugin.filetypes = {
	nix = "nix-instantiate --eval --strict $fileName",
	lua = "cd $dir && lua $fileName",
	rb = "cd $dir && ruby $fileName",
	cs = "dotnet run --project $dir",
	-- python = "steam-run ./.venv/bin/python3 $fileName",
	python = "python $fileName",
	cpp = {
		"cd $dir &&",
		"g++ $fileName",
		"-o /tmp/$fileNameWithoutExt &&",
		"/tmp/$fileNameWithoutExt",
	},
	erlang = {
		"cd $dir &&",
		"erlc $fileName &&",
		"erl -noshell -s $fileNameWithoutExt start -s init stop",
	},
	java = {
		"cd $dir &&",
		"javac $fileName -d out/ &&",
		"java -classpath out/ $fileName",
	},
	go = function()
		local file = vim.fn.expand("%")
		if string.find(file, "_test") then
			return "ginkgo ."
		else
			return {
				"cd $dir &&",
				"go build -o /tmp/$fileNameWithoutExt &&",
				"/tmp/$fileNameWithoutExt",
			}
		end
	end,
	c = function()
		local file = vim.fn.expand("%")
		if string.find(file, "*disas") then
			return {
				"cd $dir &&",
				"gcc $fileName",
				"-o $fileNameWithoutExt",
			}
		end

		if string.find(file, "solution") then
			return {
				"cd $dir &&",
				"gcc -std=c18 -lcriterion",
				"tests.c solution.c",
				"-o /tmp/tests &&",
				"/tmp/tests",
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
}

Plugin.cmd = "RunFile"

Plugin.opts = {
	mode = "term",
	focus = false,
	hot_reload = false,
	-- float = {
	-- 	close_key = "<ESC>",
	-- 	-- Window border (see ':h nvim_open_win')
	-- 	border = "single",
	--
	-- 	-- Num from `0 - 1` for measurements
	-- 	height = 1,
	-- 	width = 0.8,
	-- 	x = 0.5,
	-- 	y = 0.5,
	--
	-- 	-- Highlight group for floating window/border (see ':h winhl')
	-- 	border_hl = "FloatBorder",
	-- 	float_hl = "Normal",
	--
	-- 	-- Transparency (see ':h winblend')
	-- 	blend = 0,
	-- },
	filetype = Plugin.filetypes,
}

return Plugin
