local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

load("user.keymaps")
load("user.options")
load("user.commands")
require("user.plugins")

require("lsp.servers")
require("lsp.opts")
-- require("avalonia")
