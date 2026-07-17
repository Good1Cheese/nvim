local M = {}

M.parsers = {
    "arduino",
    "bash",
    "c",
    "c_sharp",
    "cpp",
    "css",
    "csv",
    "dockerfile",
    "editorconfig",
    "git_config",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "graphql",
    "html",
    "htmldjango",
    "ini",
    "java",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "nginx",
    "python",
    "query",
    "requirements",
    "rust",
    "sql",
    "ssh_config",
    "svelte",
    "tmux",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
    "zsh",
}

local configured = {}
for _, parser in ipairs(M.parsers) do
    configured[parser] = true
end

function M.install()
    local ok, treesitter = pcall(require, "nvim-treesitter")
    if not ok then
        vim.notify("nvim-treesitter is not loaded", vim.log.levels.ERROR)
        return
    end

    treesitter.install(M.parsers)
    vim.notify("Tree-sitter parser installation started", vim.log.levels.INFO)
end

function M.start(bufnr)
    local filetype = vim.bo[bufnr].filetype
    local parser = vim.treesitter.language.get_lang(filetype) or filetype

    if configured[parser] then
        pcall(vim.treesitter.start, bufnr, parser)
    end
end

return M
