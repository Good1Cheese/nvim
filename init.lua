local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

local da = 1313137

load("user.keymaps")
load("user.options")
load("user.commands")

require("user.plugins")
