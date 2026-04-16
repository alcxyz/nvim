# nvim

Personal Neovim configuration, based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) but fully modularized.

## Setup

```sh
git clone git@github.com:alcxyz/kickstart.nvim.git ~/.config/nvim
nvim
```

Lazy.nvim bootstraps itself and installs all plugins on first launch. Mason installs LSP servers, formatters, and tools (including `tree-sitter-cli`) automatically.

## Structure

```
init.lua                      Core settings, keymaps, autocommands, lazy.nvim bootstrap
lua/plugins/
  colorscheme.lua             Catppuccin mocha
  completion.lua              blink.cmp, LuaSnip
  editor.lua                  Treesitter, mini.nvim, zen-mode, indent-blankline, vim-sleuth
  git.lua                     Gitsigns, LazyGit, Neogit, Diffview
  lsp.lua                     LSP (mason), conform (formatting)
  obsidian.lua                Obsidian.nvim
  ui.lua                      Telescope, which-key
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| catppuccin | Colorscheme (mocha) |
| blink.cmp + LuaSnip | Completion + snippets |
| nvim-treesitter | Syntax highlighting |
| mini.nvim | Surround, text objects, statusline |
| telescope.nvim | Fuzzy finder |
| which-key.nvim | Keymap hints |
| conform.nvim | Auto-format on save |
| mason.nvim | LSP/tool installer |
| nvim-lspconfig | LSP configuration |
| gitsigns.nvim | Git gutter signs |
| lazygit.nvim | LazyGit integration |
| neogit | Git interface |
| diffview.nvim | Diff viewer |
| obsidian.nvim | Obsidian vault integration |
| zen-mode.nvim | Distraction-free writing |
| todo-comments.nvim | Highlight TODOs in comments |

## LSP Servers

Installed via Mason: `clangd`, `gopls`, `pyright`, `lua_ls`, `yamlls`, `jsonls`, `dockerls`, `docker_compose_language_service`, `ansiblels`, `helm_ls`, `bashls`, `taplo`, `marksman`, `rust_analyzer`, `ts_ls`, `html`, `cssls`, `emmet_ls`, `terraformls`

Installed via Nix (not Mason): `nixd`

## Formatters & Tools

| Language | Tool |
|----------|------|
| Lua | stylua |
| Go | gofumpt, goimports-reviser |
| Python | ruff |
| Rust | rustfmt |
| JS/TS/JSON/YAML/CSS/HTML/Markdown | prettier |
| Shell/Bash | shfmt, shellcheck |
| Nix | nixfmt |
| TOML | taplo |
| Terraform | terraform_fmt |

## Key Bindings

Leader is `Space`. See `cheatsheet.md` for the full reference.

| Keymap | Action |
|--------|--------|
| `<Space>sf` | Search files |
| `<Space>sg` | Search by grep |
| `<Space>f` | Format buffer |
| `<Space><Space>` | Find buffers |
| `grn` | LSP rename |
| `grd` | Go to definition |
| `grr` | Find references |
| `gra` | Code action |
