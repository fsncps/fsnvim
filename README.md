# fsnvim

## Introduction

> A Vim starting point for writers and other non-developer tech enthusiasts.

WORK IN PROGRESS! *unfinished and subject to change*

Another neovim starting point. I want smooth navigation and a focus on writing, not only coding. The cokeline has both tabs and buffers, and buffers have a association with a tab for ease or organization, toggle with `<Leader>bt`. 
Focus on LateX: visual lines depending on doc type.
Clio idea palace to be implemented.

**NOT** a Neovim distribution, but instead a starting point for your configuration.

## Installation

### Install Neovim

Download and install the [stable](https://github.com/neovim/neovim/releases/tag/stable) or latest version of Neovim.

### Install External Dependencies

External Requirements:

- Basic utilities: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (`xclip`/`xsel`/`win32yank` or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - If you have it, set `vim.g.have_nerd_font = true` in `init.lua`

Language Setup (if you plan to work with specific languages):

### Install fsnvim

Neovim's configurations are located under the following paths, depending on your OS:

| OS              | PATH                       |
| --------------- | -------------------------- |
| Linux, macOS    | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)   | `%localappdata%\nvim\`      |
| Windows (PowerShell) | `$env:LOCALAPPDATA\nvim\` |


[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo and then clone to `$XDG_CONFIG_HOME/nvim`

```bash
git clone https://github.com/fsncps/fsnvim "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

