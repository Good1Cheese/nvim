local lazyPath = vim.fn.stdpath( "data" ) .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat( lazyPath ) then
    vim.fn.system( { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazyPath } )
end

vim.opt.rtp:prepend( lazyPath )

local options = {
    dev = {
        path = "D:/Projects/Lua",     -- dir where local plugins are stored
        patterns = { "development" }, -- plugins that match will be searched in repos dir
        fallback = false,             -- fallback to url
    }
}

require( "lazy" ).setup( "plugins", options )
