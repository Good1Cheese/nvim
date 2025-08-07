# 🚀 Neovim Configuration

![Neovim](https://img.shields.io/badge/Neovim-%2357A143.svg?style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)

A modern, feature-rich Neovim configuration built for productivity and aesthetics.

## 🛠️ Requirements

Before using this configuration, ensure you have these tools installed:

| Tool | Purpose | Installation |
|------|---------|--------------|
| `xclip` | Clipboard integration | `sudo apt install xclip` |
| `ripgrep` | Fast text searching | `sudo apt install ripgrep` |
| `fd` | File finder | `sudo apt install fd-find` |
| `silicon` | Code screenshot generator | `cargo install silicon` |
| `xkbswitch` | Keyboard layout switching | System-specific |

## ✨ Features

### 🧩 Plugin Management
- **lazy.nvim**: Fast, on-demand plugin loading
- Automatic plugin updates
- Development mode for local plugin development

### 🤖 Language Support
- **LSP**: Full language server protocol support
  - EmmyLua for Lua development
  - Rust Analyzer, gopls, pylsp, and more
- **Treesitter**: Advanced syntax highlighting and code analysis
- **blink.cmp**: Modern completion framework with AI integration

### 🎨 UI/UX Enhancements
- **cyberdream theme**: Beautiful dark theme with ayu base
- **lualine**: Elegant status line with harpoon integration
- **oil.nvim**: Modern file explorer
- **telescope**: Fuzzy finder for files, grep, and more
- **harpoon**: Quick file navigation with bookmarks

### ⌨️ Productivity Tools
- **neotest**: Test runner for Go and Rust
- **conform.nvim**: Automatic code formatting (ruff, clang-format, etc.)
- **snippets**: LuaSnip with friendly-snippets
- **gitsigns**: Git integration with inline diff markers
- **silicon**: Generate beautiful code screenshots

### 🔧 Key Features
- **WhichKey**: Discoverable keybindings
- **Mason**: LSP, DAP, linter, and formatter installer
- **Outline**: Code structure overview
- **vim-illuminate**: Highlight references to current symbol
- **toggleterm**: Integrated terminal

## ⌨️ Key Bindings

| Binding | Action |
|--------|--------|
| `<leader>c` | Run current file/test |
| `<leader>t` | Open terminal |
| `<leader>f` | Find files |
| `<leader>s` | Search in files |
| `<A-d>` | Open harpoon quick menu |
| `<A-1>`, `<A-2>`, etc. | Jump to harpoon marks |
| `<leader>a` | Open code outline |
| `<leader>m` | Open Mason package manager |

## 🎮 Installation

1. Backup your existing Neovim configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.config/nvim
   ```

3. Start Neovim and let lazy.nvim install the plugins:
   ```bash
   nvim
   ```

4. Wait for all plugins to install (this may take a few minutes)

## 📸 Screenshots

> *Coming soon - example screenshots of the configuration in action*


## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.