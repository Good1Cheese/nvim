local Config = {}

Config.path = "~/.config/nvim/lua/cfg/"
Config.getFileNames = string.format("ls %s | cut -d '.' -f -1", Config.path)

function Config:Load()
    for fileName in io.popen(self.getFileNames):lines() do
        local file = string.format("cfg.%s", fileName)
        require(file)
    end
end

return Config
