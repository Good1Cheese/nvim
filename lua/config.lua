local Config = {}

Config.path = "~/.config/nvim/lua/cfg/*"
Config.getFileNames = string.format("find %s -name '*.lua' | cut -b 31- | cut -d '.' -f -1", Config.path)

function Config:Load()
    for file in io.popen(self.getFileNames):lines() do
        require(file)
    end
end

return Config
