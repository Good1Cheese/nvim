return {
	"nvim-pack/nvim-spectre",
	config = function()
		vim.keymap.set("n", "<leader>Rr", "<cmd>lua require('spectre').toggle()<CR>", {
			desc = "Toggle Spectre"
		})
		vim.keymap.set("n", "<leader>Rw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", {
			desc = "Search current word"
		})
		vim.keymap.set("v", "<leader>Rw", "<esc><cmd>lua require('spectre').open_visual()<CR>", {
			desc = "Search current word"
		})
		vim.keymap.set("n", "<leader>Rp", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", {
			desc = "Search on current file"
		})
	end
}
