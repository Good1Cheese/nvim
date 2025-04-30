local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

vim.deprecate = function() end

load("user.keymaps")
load("user.options")
load("user.commands")

require("user.plugins")
-- load("user.lsp-servers")
-- load("user.lsp-opts")
