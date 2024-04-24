local Plugin = { "CRAG666/code_runner.nvim" }

Plugin.cmd = "RunFile"

Plugin.opts = {
	-- mode = "better_term",
	focus = false,
	-- better_term = {
	--     number = 1,
	-- },
	filetype = {
		cpp = {
			"cd $dir &&",
			"g++ $fileName",
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
		--nix = {
		--    ":w !sudo tee %<cr>",
		--    "sudo nixos-rebuild switch",

		--	"cd $dir &&",
		--	"bash $fileName",
		--},
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
