# NVChad C Development Setup (GCC + PostgreSQL)

## 1. System Dependencies

```bash
sudo apt update && sudo apt install gcc build-essential clangd libpq-dev postgresql-server-dev-all
npm install -g tree-sitter-cli
```

## 2. LSP Configuration

File: `~/.config/nvim/lua/configs/lspconfig.lua`

```lua
require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
  },
})

local servers = { "html", "cssls", "clangd" }
vim.lsp.enable(servers)
```

## 3. Formatter Configuration

File: `~/.config/nvim/lua/configs/conform.lua`

```lua
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang_format" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
return options
```

Install the formatter inside nvim:
```
:MasonInstall clang-format
```

## 4. clangd Global Config

File: `~/.config/clangd/config.yaml`

```yaml
CompileFlags:
  Add: [-Wall, -std=c17]
```

This makes clangd work globally without needing a `compile_flags.txt` per project.

## 5. Treesitter

Install the C parser inside nvim:
```
:TSInstall c
```

## 6. Custom Keymaps

File: `~/.config/nvim/lua/mappings.lua` — add:

```lua
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })
```

## 7. Compiling

Basic:
```bash
gcc main.c -o main && ./main
```

With PostgreSQL:
```bash
gcc main.c -o main -lpq && ./main
```

## 8. Useful NVChad Shortcuts

| Shortcut | Action |
|---|---|
| `Space` + `c` + `a` | Code actions (LSP fix suggestions) |
| `Space` + `f` + `m` | Format file manually |
| `Space` + `h` | Open terminal (horizontal) |
| `Ctrl+n` | Toggle file explorer |
| `Tab` / `Shift+Tab` | Next / previous buffer tab |
| `gcc` | Toggle comment on line |
| `gc` (visual) | Toggle comment on selection |

## 9. Sharing Config via Git

```bash
cd ~/.config/nvim
git init
git add .
git commit -m "initial nvim config"
git remote add origin https://github.com/seu-usuario/nvim-config.git
git push -u origin main
```

To restore on another machine:
```bash
git clone https://github.com/seu-usuario/nvim-config.git ~/.config/nvim
nvim  # lazy installs everything automatically
```
