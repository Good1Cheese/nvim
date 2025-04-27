local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

load("user.keymaps")
load("user.options")
load("user.commands")


print("dadad")
require("user.plugins")

-- load("user.lsp-servers")
-- load("user.lsp-opts")
