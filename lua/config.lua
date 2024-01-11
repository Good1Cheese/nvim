local Config = {}

Config.pathToLua = vim.env.HOME .. "/.config/nvim/lua/"
Config.pathToCfg = Config.pathToLua .. "cfg"

Config.getFileNames = string.format("find %s -name '*.lua' -not -name '.*' | cut -b %s- | cut -d '.' -f -1",
        Config.pathToCfg,
        #Config.pathToLua + 1)

function Config:Load()
    for file in io.popen(self.getFileNames):lines() do
        require(file)
    end
end

return Config
