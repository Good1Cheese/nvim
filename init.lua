local load = function(mod)
    package.loaded[mod] = nil
    require(mod)
end

load("user.keymaps")
load("user.options")
load("user.registers")
load("user.commands")
require("user.lazy")

require("lsp.init").setup()
-- require("avalonia")
