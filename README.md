### Install FSNVIM

> **NOTE**
> [Backup](#FAQ) your previous configuration (if any exists)

Neovim's configurations are located under the following paths, depending on your OS:

| OS               | PATH                      |
| ---------------- | ------------------------- |
| Linux, MacOS     | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)    | `%localappdata%\nvim\`     |
| Windows (powershell) | `$env:LOCALAPPDATA\nvim\` |

#### Recommended Step

[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo so that you have your own copy that you can modify, then install by cloning the fork to your machine using one of the commands below, depending on your OS.

> **NOTE**
> Your fork's url will be something like this:
> `https://github.com/<your_github_username>/fsnvim.git`

#### Clone fsnvim
> **NOTE**
> If following the recommended step above (i.e., forking the repo), replace
> `fsncps` with `<your_github_username>` in the commands below.

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/fsncps/fsnvim "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

</details>
<details><summary> Windows </summary>

If you're using cmd.exe:

arduino

git clone https://github.com/fsncps/fsnvim %localappdata%\nvim\

If you're using powershell.exe:

bash

git clone https://github.com/fsncps/fsnvim $env:LOCALAPPDATA\nvim\

</details>
