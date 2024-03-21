# My personal configutation for awesome Neovim<br>
 
## ⚡️ Requirements
- ***clipboard tool*** for nvim copy/paste {[ xclip ](https://github.com/astrand/xclip)}
- ***ripgrep*** for telescope give_grep **(optional)**
- ***fd*** for neotree fuzzy finder

### BASH LSP:<br>
```
npm i -g bash-language-server
pacman -S shellcheck
```

### 💥 LSP
- ***Lua Language Server*** for awesome LSP { through mason or [source ](https://github.com/LuaLS/lua-language-server)}<br>
- ***Lua_LS Garrysmode addon*** for gmod API support {[ source ](https://github.com/LuaLS/LLS-Addons/tree/main/addons/garrysmod)}<br>
>**$HOME/.local/state/Lua_Addons/$Your_Addon$**

### 🔍 DAP
- ***Luarocks***<br>
**Busted** for unit-tests { [source](https://github.com/lunarmodules/busted) }
- ***Lua debugger*** for debugging {[ source ](https://github.com/tomblind/local-lua-debugger-vscode)}<br>
>**$HOME/.local/state/$Your_Debugger$**
