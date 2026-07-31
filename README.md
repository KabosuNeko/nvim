# Nvim

Minimal Neovim config for daily use.

## Install

``` bash
git clone https://github.com/KabosuNeko/nvim ~/.config/nvim
```

Requirements: `fd`, `rg`, `stylua`, `gofmt`, `clang-format`, `wl-clipboard` (or xclip).

## Plugins

alpha-nvim, which-key, treesitter, nvim-cmp, conform, gitsigns, ts-comments,
todo-comments, guess-indent, gruvbox, render-markdown, toggleterm, neo-tree,
telescope

## Keymaps

| Key | Action |
|---|---|
| `<space>` | Leader |
| `<leader>ff` | Find files |
| `<leader>fw` | Grep |
| `<leader>fb` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>e` | Neo-tree (float) |
| `<leader>dd` | Dashboard |
| `<M-w>` | Toggle terminal |
| `<leader>/` | Toggle comment |
| `<C-h/j/k/l>` | Switch window |
| `;` | Command mode |
| `<Esc>` | Clear search highlight |
| `<leader>ws` | Save as |
| `<leader>wr` | Quick substitute |
