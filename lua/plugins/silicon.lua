local Plugin = { "michaelrommel/nvim-silicon" }

Plugin.lazy = false

function Plugin.config()
	local wk = require("which-key")
	wk.register({
		["s"] = { ":Silicon<cr>", "Make screenshot" },
	}, { mode = "v" })

	require("silicon").setup({
		font = "JetBrainsMono Nerd Font=35;Noto Color Emoji=34",
		theme = "Coldark-Dark",
		pad_horiz = 100, -- (number) The horizontal padding.
		pad_vert = 80, -- (number) The vertical padding.
		to_clipboard = true,
		no_line_number = false,
		output = function()
			return "./" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
		end,
		window_title = function()
			return vim.fn.bufname(vim.fn.bufnr())
		end,
	})
end

return Plugin
