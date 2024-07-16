local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

load("user.keymaps")
load("user.options")
load("user.commands")

require("user.plugins")

vim.cmd("Oil")
