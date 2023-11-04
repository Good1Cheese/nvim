-- require("nvim-treesitter.configs").setup({
--     ejnsure_installed = { "cpp", "python", "lua", "javascript" },
--     sync_install = false,
--     highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = false
--     }
-- })

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main",
    },
}
