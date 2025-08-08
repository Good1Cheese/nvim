
# Neovim Configuration

This is a personalized Neovim configuration with a focus on a clean, modern aesthetic and powerful features for Lua development.

## Features

- **Plugin Management**: Uses `lazy.nvim` for efficient plugin loading.
- **LSP**: Integrated language server protocol support with `nvim-lspconfig` and `mason.nvim` for easy language server management.
- **Autocompletion**: Enhanced autocompletion with `blink.cmp`.
- **Appearance**:
  - **Colorscheme**: `Ayu` and `Cyberdream` themes for a pleasant coding environment.
  - **UI**: `lualine.nvim` for a customized statusline and `nvim-web-devicons` for file icons.
- **File Management**: `oil.nvim` provides a powerful file explorer.
- **Git Integration**: `gitsigns.nvim` for git decorations.
- **Telescope**: Fuzzy finding for files, buffers, and more.
- **Treesitter**: Advanced syntax highlighting and code parsing.

## Requirements

- **Neovim**: Version 0.8 or higher.
- **Nerd Font**: A Nerd Font is required for the icons to render correctly. JetBrainsMono Nerd Font is recommended.
- **Linters/Formatters**: `emmylua-analyzer-rust` for Lua development.
- **Other Tools**: `xclip`, `silicon`, `fd`, and `ripgrep`.

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```
2. Install the required dependencies (Nerd Font, and etc).
3. Launch Neovim. The plugins will be installed automatically on the first run.
