# Neovim configuration

Personal Neovim configuration targeting **Neovim 0.12.x**, built around native LSP APIs, `lazy.nvim`, the rewritten `nvim-treesitter` main branch, Blink completion, Snacks for general UI/discovery, Oil for filesystem editing, and a deliberately small set of focused plugins.

The configuration follows one rule wherever practical: **use Neovim core or an already-installed platform plugin before adding another single-purpose plugin**.

## Requirements

### Required

- **Neovim 0.12.x or newer**.
- `git`, `curl`, `tar`, `gzip`, and `unzip`.
- A C/C++ compiler toolchain.
- `tree-sitter` CLI **0.26.1+**, preferably from the system package manager.
- `ripgrep` (`rg`) and `fd` for Snacks picker.
- A Nerd Font for icons.

### Recommended / feature-specific

- `wl-copy`/`wl-paste` on Wayland or another Neovim clipboard provider.
- `lazygit` for `<leader>L`.
- `zsh` for the configured Snacks terminal.
- `jupytext` for editing `.ipynb` files through `jupytext.nvim`.
- `silicon` for code screenshots.
- Language runtimes for the languages you actually use. Mason installs editor tooling; it does not replace a JDK, .NET SDK, Go, Rust, Node.js, Python, etc.

## Installation

Back up an existing configuration first, then clone this repository to Neovim's config directory:

```sh
git clone <repository-url> ~/.config/nvim
nvim
```

After the first plugin bootstrap, run:

```vim
:Lazy sync
:MasonInstallAll
:TSInstallAll
:checkhealth
```

`nvim-treesitter` installation is asynchronous, so `:TSInstallAll` can return before every parser has finished compiling.

## Tool manifests and bootstrap commands

Tooling stays deliberately simple and explicit:

- `lua/tools/mason.lua` — one plain `M.packages` list of external LSP servers, linters, and formatters managed by Mason.
- `lua/tools/treesitter.lua` — the Tree-sitter parser list used by this config.
- `lua/tools/lsp.lua` — the LSP config-name list plus the small set of server overrides used by `vim.lsp.config()` / `vim.lsp.enable()`.

There is intentionally no Mason profile layer and no `mason-lspconfig.nvim` mapping layer. Mason installs binaries; Neovim enables LSP configs. The two lists remain readable enough to maintain directly. The Go toolchain is kept intact, including `gopls`, `golangci-lint-langserver`, `golangci-lint`, `gofumpt`, `golines`, and `revive`.

### `:MasonInstallAll[!]`

Installs the packages declared in `lua/tools/mason.lua`.

```vim
:MasonInstallAll
```

installs missing configured packages.

```vim
:MasonInstallAll!
```

reinstalls the complete configured package list. This is useful after a registry update or when repairing a broken tool installation.

### `:TSInstallAll[!]`

Installs all parsers declared in `lua/tools/treesitter.lua` through the current `nvim-treesitter` main-branch API.

```vim
:TSInstallAll
```

installs missing parsers.

```vim
:TSInstallAll!
```

forces reinstall of the configured parsers.

Parser installation is capped at four parallel jobs.

### Related maintenance commands

```vim
:Lazy update
:MasonUpdate
:TSUpdate
:checkhealth
```

After a large `nvim-treesitter` update, run `:TSUpdate` so installed parsers and queries stay in sync with the plugin.

## Architecture

```text
init.lua
├── snippets/
│   ├── package.json
│   └── lua.json
└── lua/
    ├── user/
    │   ├── keymaps.lua
    │   ├── options.lua
    │   ├── commands.lua
    │   ├── registers.lua
    │   └── lazy.lua
    ├── lsp/
    │   ├── init.lua
    │   └── opts.lua
    ├── tools/
    │   ├── lsp.lua
    │   ├── mason.lua
    │   └── treesitter.lua
    └── plugins/
        └── *.lua
```

`lazy.nvim` uses `defaults.lazy = true`, so each plugin must either have a real trigger (`keys`, `cmd`, `event`, `ft`), be loaded as a dependency, or explicitly use `lazy = false`.

Intentional eager exceptions include:

- `nvim-treesitter`, because the rewritten main branch does not support plugin-manager lazy-loading.
- `oil.nvim`, because it owns directory buffers and needs to be available before directory editing begins.
- `jupytext.nvim`, because it must register notebook read handling before an `.ipynb` buffer is opened.
- Mason, so its registry APIs and bootstrap commands are always available.
- Snacks, because several UI and integration modules are shared across the config.

Harpoon2 is key-triggered and therefore remains genuinely lazy. It is kept for the small working-set workflow and its split/tab actions from the quick menu.

## LSP

LSP setup uses Neovim's native API:

```lua
vim.lsp.config(...)
vim.lsp.enable(...)
```

The legacy `require("lspconfig").SERVER.setup(...)` path is intentionally not used.

Configured servers live in `lua/tools/lsp.lua`. That file keeps a plain server-name list and only two explicit overrides: Rust uses Clippy for checks, and EmmyLua receives Neovim runtime/plugin libraries when the workspace is this Neovim config. TypeScript uses the normal `ts_ls` configuration from `nvim-lspconfig`; there is no additional TypeScript wrapper plugin.

The project `.emmyrc.json` no longer contains machine-specific `/home/...` library paths and now declares `LuaJIT`. Neovim-specific library paths are derived at runtime from `vim.env.VIMRUNTIME` and `stdpath("data")`, so the config is portable between machines. Blink v1 already augments the wildcard LSP capabilities on modern Neovim, so the LSP setup does not duplicate completion-capability plumbing.

## Tree-sitter

The config follows the rewritten `nvim-treesitter` main-branch model:

- plugin-manager lazy-loading is disabled;
- parsers are installed with `require("nvim-treesitter").install(...)`;
- highlighting is enabled with `vim.treesitter.start()`;
- `:TSUpdate` is the plugin update build step.

Do not copy legacy `nvim-treesitter.configs.setup({ ensure_installed = ... })` examples from the old branch into this configuration.

## Completion and snippets

Completion is provided by **Blink v1.x**. The config intentionally stays on the stable v1 line instead of following Blink v2 development.

The completion stack is now:

- Blink built-in LSP source;
- Blink built-in path source;
- Blink built-in buffer source;
- Blink built-in snippet source;
- `friendly-snippets` as the shared snippet collection;
- Neovim's native `vim.snippet` engine.

LuaSnip and `lspkind.nvim` are not required.

Blink automatically reads VSCode-style personal snippets from `~/.config/nvim/snippets/`. The old custom `Plugin` LuaSnip snippet has been converted to `snippets/lua.json`. If `vim.g.vscode_snippets_path` points to another VSCode-style snippet directory, that directory is also searched.

Current Blink-specific choices include:

- Enter-style completion mappings;
- `<Tab>` / `<S-Tab>` for native snippet jumps and completion navigation;
- ghost text;
- automatic documentation with a small delay rather than opening it on every selection immediately;
- LSP signature help;
- `label_description` in the completion menu, useful for module/import context;
- file icons for path completion through the already-installed devicons plugin.

## File discovery and filesystem editing

The normal fuzzy-discovery workflow is **Snacks picker**:

- `<leader>f` — files;
- `<leader>s` — live grep;
- `<leader>S` — resume the previous picker;
- `<leader>sd` — diagnostics;
- `<leader>sD` — current-buffer diagnostics;
- `<leader>u` — undo history.

The standalone Telescope config has been removed.

`Arduino-Nvim` is a local optional plugin and still declares Telescope as one of its own dependencies. Therefore Telescope may still be installed/loaded when that local Arduino integration is present, but it is no longer part of the normal editor workflow.

**Oil** remains the filesystem editor. It is intentionally not replaced by Snacks explorer because Oil's editable-buffer model is a distinct workflow rather than another fuzzy picker.

Useful Oil mappings include:

- `l` — open/select entry;
- `h` — parent directory;
- `<C-s>` — vertical split;
- `<C-h>` — horizontal split;
- `<C-t>` — tab;
- `g.` — toggle hidden files;
- `g\\` — toggle trash view.

`oil-lsp-diagnostics.nvim` remains as an Oil dependency. `oil-git.nvim` was removed because its uncached Git-status refresh runs whenever Oil opens a directory and can make directory transitions visibly stall in repositories. Gitsigns and Diffview still provide the normal Git workflow, while Oil navigation no longer waits on directory-level Git decoration. Snacks receives Oil rename/move events so attached LSP clients can be notified about file renames.

## Working-set navigation: Harpoon2

The config uses **Harpoon2** for a deliberately small working set of files. It is lazy-loaded from its keymaps and keeps the previous muscle memory:

| Mapping | Action |
| --- | --- |
| `<A-d>` | Toggle Harpoon quick menu |
| `<A-e>` | Add the current file |
| `<A-1>` … `<A-4>` | Jump directly to Harpoon slot 1 … 4 |

Inside the Harpoon menu, `l` opens the selected item, `<C-v>` opens it in a vertical split, `<C-x>` in a horizontal split, and `<C-t>` in a new tab. Plenary remains a Harpoon dependency.

## Terminal

`toggleterm.nvim` has been removed in favor of **Snacks terminal**.

The migration preserves the behavior that mattered in the old config:

- shell is still `zsh`;
- `<leader>t` toggles the terminal;
- the same terminal process is kept alive while its window is hidden;
- one terminal object is reused for the whole Neovim session even if Neovim's cwd later changes;
- `<Esc>` leaves terminal-input mode with a single press, matching the old mapping.

This last point is deliberate: raw `Snacks.terminal.toggle()` identifies terminals by command, cwd, environment, and count. The config instead holds a reference to the main terminal object so changing cwd does not silently create a second shell.

Neither ToggleTerm nor this Snacks setup persists the shell process across Neovim restarts. If the workflow later grows to multiple numbered terminals, named terminals, `TermExec`, send-to-terminal operations, or mixed layouts, ToggleTerm would again provide meaningful functionality rather than being redundant.

## Comments

`Comment.nvim` is **kept intentionally** for now.

Neovim 0.12 already provides native `gc`, `gcc`, Visual `gc`, dot-repeat-compatible line commenting, and Tree-sitter-aware comment strings for injected languages. That means Comment.nvim is no longer necessary merely to obtain basic line commenting.

However, the existing plugin setup still provides features not fully mirrored by the built-in mappings:

- blockwise `gb` / `gbc` commenting;
- `gco`, `gcO`, and `gcA` comment insertion helpers;
- Comment.nvim's block/line operator behavior and count support;
- the TSX/JSX `nvim-ts-context-commentstring` pre-hook;
- the custom `<A-/>` line-comment workflow.

For that reason this plugin is kept. If those extra mappings turn out to be unused, Comment.nvim and `nvim-ts-context-commentstring` become good candidates for a later removal, with `<A-/>` mapped to native commenting instead.

## Symbols, diagnostics, and code actions

`outline.nvim` has been removed because **Trouble already provides the symbols view**.

- `<leader>a` — Trouble symbols view (replaces Outline);
- `<leader>cs` — Trouble symbols view;
- `<leader>cl` — Trouble LSP view;
- `<leader>xx` — diagnostics;
- `<leader>xX` — current-buffer diagnostics;
- `<leader>xL` — location list;
- `<leader>xQ` — quickfix list.

`actions-preview.nvim` remains for the dedicated code-action preview workflow. Native `vim.lsp.buf.code_action()` is already available through `<F4>` / `gra`, but the plugin is intentionally kept because it previews the edits produced by an action before it is applied. Upstream was updated specifically for Neovim 0.12 in 2026, so this is not legacy compatibility baggage.

## Utility plugins after the second minimalism pass

The utility layer is intentionally evaluated by **capability**, not by raw plugin count.

### Removed or absorbed by core / existing plugins

- `fidget.nvim` was removed. Lualine now combines Neovim 0.12 generic progress via `vim.ui.progress_status()` with LSP work-done progress via `vim.lsp.status()`, and refreshes on both `Progress` and `LspProgress`. This keeps progress visible without a separate progress UI plugin.
- `cyberdream.nvim` is intentionally kept. Ayu remains the active editor colorscheme, while Lualine uses its Cyberdream theme; Cyberdream is also available for quick manual colorscheme switching.
- `which-key.nvim` no longer owns ordinary mappings. Each mapping now lives with the plugin or core module that implements it. Which-key remains only as a discoverability UI and for group metadata. Removing Which-key later will therefore not remove editor functionality.
- Floating-window border style is now centralized with Neovim 0.12 `winborder = "rounded"`. Mason and Oil inherit it instead of carrying duplicate border settings.

### Kept intentionally

- `nvim-autopairs` stays because Neovim/Blink snippet support does not provide general delimiter pairing while typing. Its config is now just `opts = {}` because the old explicit exclusions match current upstream defaults.
- `guess-indent.nvim` stays because built-in EditorConfig only helps when a project has an EditorConfig file. Guess-indent handles arbitrary existing files. It now loads on `BufReadPre` / `BufNewFile`, rather than `VeryLazy`, so a file passed directly to `nvim file` is not missed. The previous option table was removed because it duplicated upstream defaults exactly.
- `vim-illuminate` stays. It provides reference navigation plus LSP/Tree-sitter/regex fallback. Its current upstream includes a 2026 fix for the rewritten Tree-sitter main branch. `Snacks.words` was considered, but it only targets LSP references and currently has a known Neovim-0.12 redraw issue reported upstream, so replacing Illuminate would be a behavioral regression rather than a clean simplification. Its denylist now preserves upstream defaults and adds Oil, and custom highlight colors are restored after `:colorscheme` changes.
- `gx.nvim` stays because it provides more than Neovim's native `gx`: GitHub issue resolution, package/dependency handlers, Go-package handling, and web-search fallback. The obsolete `vim.g.netrw_nogx` setting was removed because modern Neovim owns native `gx` rather than netrw.
- `dropbar.nvim` stays because Neovim has a winbar primitive but no native breadcrumb/symbol-context UI comparable to Dropbar.
- `oil.nvim` stays, but its setup now contains only real deviations from upstream defaults; copied defaults for columns, cursor constraints, standard keymaps, natural sorting, and popup borders were removed. `oil-git.nvim` was removed after tracing a directory-navigation delay to its uncached Git-status refresh.
- `todo-comments.nvim` stays because it adds syntax highlighting and structured TODO discovery rather than just grep. It is now connected to the existing UI stack with `]t` / `[t`, `<leader>st` via Snacks picker, and `<leader>xt` via Trouble.
- `lualine.nvim` stays because replacing branch/diff/diagnostic components with a hand-written statusline would trade one maintained plugin for more custom statusline code.
- `which-key.nvim` stays for key discovery, but is no longer a dependency of the keymap architecture.

`bg.nvim` is also kept, but its spec now points at the canonical `typicode/bg.nvim` repository rather than the older repository path.

## Git

- `gitsigns.nvim` stays for inline hunks and lightweight buffer-local Git operations.
- `diffview.nvim` stays for repository-scale diffs and history workflows.
- Snacks provides `<leader>L` for Lazygit.

These are complementary rather than duplicate interfaces.

## Selected keymaps

Mappings are defined next to the feature that owns them (plugin spec or `lua/user/keymaps.lua`). Which-key only displays them; it is not responsible for creating the editor workflow.

| Mapping | Action |
| --- | --- |
| `<leader>e` | Oil explorer |
| `<leader>f` | Snacks files |
| `<leader>s` | Snacks live grep |
| `<leader>S` | Resume Snacks picker |
| `<leader>sd` | Workspace diagnostics picker |
| `<leader>sD` | Buffer diagnostics picker |
| `<leader>st` | TODO comments in Snacks picker |
| `<leader>xt` | TODO comments in Trouble |
| `]t` / `[t` | Next / previous TODO comment |
| `]]` / `[[` | Next / previous illuminated reference |
| `<leader>c` | Save and run current file |
| `<leader>C` | Close Code Runner terminal |
| `<leader>l` | Code actions preview |
| `<leader>a` | Trouble symbols |
| `<leader>t` | Persistent Snacks zsh terminal |
| `<leader>L` | Lazygit |
| `<leader>9s` | Sudo-write current buffer |
| `<A-d>` | Harpoon quick menu |
| `<A-e>` | Add current file to Harpoon |
| `<A-1>` … `<A-4>` | Harpoon direct slots |

The config also defines `langmap` so normal-mode commands continue to work while a Russian keyboard layout is active.

## Sudo write

`:Suw` writes the current buffer through `sudo dd`.

The sudo password is sent to the child process through stdin and is not embedded in `sh -c` or command-line arguments. The temporary file is cleaned up on success and on an empty-password abort.

## Jupyter notebooks

`jupytext.nvim` converts `.ipynb` buffers to a text representation through the external `jupytext` CLI.

Gitsigns is deliberately disabled for `.ipynb` buffers because Jupytext transforms notebook contents during read/write and the two workflows do not combine cleanly on notebook buffers.

## AI

There is deliberately **no in-Neovim AI plugin stack** in this configuration.

The previous Avante/Minuet-related specs and their optional UI/provider dependencies were removed. AI tooling can be used externally without making it part of Neovim's startup, dependency graph, completion path, or maintenance surface.

## Local / optional plugins

Some specs exist only when a local dependency is available:

- `Arduino-Nvim` — loaded from `~/Personal/arduino/Arduino-Nvim` for the `arduino` filetype. It currently declares Telescope as a dependency.
- `cdw-relay.nvim` — loaded from `~/Personal/cdw/cdw-relay.nvim` when that directory exists.
- `esp32.nvim` — enabled only when `NVIM_ESP32=1`.

They are not required for the rest of the configuration to start.

## Compatibility and maintenance notes

This configuration was audited against current plugin APIs on **2026-08-31** with Neovim **0.12.x** as the target.

Notable decisions:

- native `vim.lsp.config` / `vim.lsp.enable` instead of legacy lspconfig setup calls;
- a deliberately plain Mason package list instead of language profiles or a `mason-lspconfig.nvim` translation layer;
- no `vim.deprecate` monkey-patch;
- diagnostics configured through `vim.diagnostic.config()`;
- current Snacks/Oil rename event shape;
- current `nvim-silicon` Lua module name;
- Diffview's maintained repository while preserving the local lazy/lock name;
- Which-key on its recommended `VeryLazy` event, with actual mappings owned by their feature modules instead of Which-key;
- native Neovim 0.12 `vim.ui.progress_status()` + `vim.lsp.status()` progress in Lualine instead of Fidget;
- Lualine using the Cyberdream theme while Ayu remains the active editor colorscheme;
- canonical `typicode/bg.nvim` repository;
- global Neovim `winborder` used as the default floating-window border instead of repeating rounded-border config;
- Oil config reduced to local behavior overrides instead of a snapshot of upstream defaults;
- Blink kept on stable v1.x;
- Harpoon2 kept as the explicit working-set navigator;
- no standalone Telescope workflow, ToggleTerm, Outline, LuaSnip, `lspkind.nvim`, Avante, Minuet, or Fidget in the main workflow.

### Intentional non-migrations

Some choices are current but are not the smallest theoretically possible setup:

- `lazy.nvim` remains the package/lazy-loading orchestrator instead of moving to `vim.pack` in the same pass.
- Mason remains the external-tool installer instead of moving every tool to the system package manager. Its bootstrap remains a direct package list on purpose.
- Comment.nvim remains because its blockwise and extra comment workflows are still potentially useful.
- `ts_ls`, `pylsp`, `omnisharp`, and other configured LSP servers remain valid configurations; replacing language servers is a tooling preference, not an API maintenance requirement.

## `:checkhealth` notes

Not every warning is a configuration bug:

- Mason may report missing language runtimes needed only for languages you actually use.
- Diffview may report missing optional VCS executables such as Mercurial, Perforce, or Jujutsu when Git itself is available.
- Snacks image health can report missing Kitty/WezTerm/Ghostty graphics support even when the image module is disabled.
- Which-key can report prefix overlaps for operators or Comment.nvim mappings as informational warnings.

After changing the plugin graph, run:

```vim
:Lazy sync
:checkhealth
:checkhealth vim.deprecated
:ConformInfo
```

For tool bootstrap failures, run `:MasonInstallAll` and `:TSInstallAll`, restart Neovim, then run `:checkhealth` again.
