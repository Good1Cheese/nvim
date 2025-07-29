---@brief
---
--- https://github.com/EmmyLuaLs/emmylua-analyzer-rust
---
--- Emmylua Analyzer Rust. Language Server for Lua.
---
--- `emmylua_ls` can be installed using `cargo` by following the instructions[here]
--- (https://github.com/EmmyLuaLs/emmylua-analyzer-rust?tab=readme-ov-file#install).
---
--- The default `cmd` assumes that the `emmylua_ls` binary can be found in `$PATH`.
--- It might require you to provide cargo binaries installation path in it.

return {
    cmd = { "emmylua_ls" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".emmyrc.json",
        ".luacheckrc",
    },
    workspace_required = false,
}

-- vim.lsp.config['emmylua'] = {
--   settings = {
--     codeAction = {
--       insertSpace = false
--     },
--     codeLens = {
--       enable = true
--     },
--     completion = {
--       autoRequire = true,
--       autoRequireFunction = "require",
--       autoRequireNamingConvention = "keep",
--       autoRequireSeparator = ".",
--       callSnippet = false,
--       enable = true,
--       postfix = "@"
--     },
--     diagnostics = {
--       diagnosticInterval = 500,
--       disable = {},
--       enable = true,
--       enables = {},
--       globals = {},
--       globalsRegex = {},
--       severity = {}
--     },
--     documentColor = {
--       enable = true
--     },
--     hint = {
--       enable = true,
--       indexHint = true,
--       localHint = true,
--       overrideHint = true,
--       paramHint = true
--     },
--     hover = {
--       enable = true
--     },
--     references = {
--       enable = true,
--       fuzzySearch = true,
--       shortStringSearch = false
--     },
--     resource = {
--       paths = {}
--     },
--     runtime = {
--       classDefaultCall = {
--         forceNonColon = false,
--         forceReturnSelf = false,
--         functionName = ""
--       },
--       extensions = {},
--       frameworkVersions = {},
--       requireLikeFunction = {},
--       requirePattern = {},
--       version = "LuaLatest"
--     },
--     semanticTokens = {
--       enable = true
--     },
--     signature = {
--       detailSignatureHelper = true
--     },
--     strict = {
--       arrayIndex = true,
--       docBaseConstMatchBaseType = true,
--       metaOverrideFileDefine = true,
--       requirePath = false,
--       typeCall = false
--     },
--     workspace = {
--       enableReindex = false,
--       encoding = "utf-8",
--       ignoreDir = {},
--       ignoreGlobs = {},
--       library = {},
--       moduleMap = {},
--       preloadFileSize = 0,
--       reindexDuration = 5000,
--       workspaceRoots = {}
--     }
--   }
-- }
