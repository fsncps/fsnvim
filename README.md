# FSNVIM

## Introduction

A starting point for Neovim for writers and other non-developer tech enthusiasts.

WORK IN PROGRESS! *unfinished and subject to change*

- **Small**
- **Modular**
- **For more fun with your workflow**

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

- **Typescript**: You need `npm`
- **Golang**: You need `go`
- **Others**: Install as needed

> **NOTE**  
> See [Install Recipes](#install-recipes) for additional Windows and Linux-specific notes and quick install snippets.

### Install FSNVIM

> **NOTE**  
> [Backup](#faq) your previous configuration (if any exists).

Neovim's configurations are located under the following paths, depending on your OS:

| OS              | PATH                       |
| --------------- | -------------------------- |
| Linux, macOS    | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)   | `%localappdata%\nvim\`      |
| Windows (PowerShell) | `$env:LOCALAPPDATA\nvim\` |

#### Recommended Step

[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo so that you have your own copy that you can modify. Then install by cloning the fork to your machine using one of the commands below, depending on your OS.

> **NOTE**  
> Your fork's URL will be something like this:  
> `https://github.com/<your_github_username>/fsnvim.git`

#### Clone FSNVIM

> **NOTE**  
> If following the recommended step above (i.e., forking the repo), replace `fsncps` with `<your_github_username>` in the commands below.

##### Linux and macOS

```bash
git clone https://github.com/fsncps/fsnvim "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

##### Windows

If you're using cmd.exe:

cmd

```bash
git clone https://github.com/fsncps/fsnvim %localappdata%\nvim\
```

If you're using powershell.exe:

powershell

```bash
git clone https://github.com/fsncps/fsnvim $env:LOCALAPPDATA\nvim\
```
