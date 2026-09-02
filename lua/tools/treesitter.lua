local M = {}

-- Single source of truth for parsers used by this config.
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
    "regex",
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

---Install every parser declared in M.parsers.
---nvim-treesitter's main-branch install API is asynchronous.
---@param command_opts? table
function M.install_all(command_opts)
    local ok, treesitter = pcall(require, "nvim-treesitter")
    if not ok then
        vim.notify("nvim-treesitter is not loaded", vim.log.levels.ERROR, { title = "Tree-sitter" })
        return
    end

    local force = command_opts and command_opts.bang or false
    treesitter.install(M.parsers, { force = force, summary = true, max_jobs = 4 })

    vim.notify(
        force and "Tree-sitter parser reinstallation started" or "Tree-sitter parser installation started",
        vim.log.levels.INFO,
        { title = "Tree-sitter" }
    )
end

function M.start(bufnr)
    local filetype = vim.bo[bufnr].filetype
    local parser = vim.treesitter.language.get_lang(filetype) or filetype

    if configured[parser] then
        pcall(vim.treesitter.start, bufnr, parser)
    end
end

return M
