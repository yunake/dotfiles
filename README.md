## Install

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply yunake
```

### Tools & prerequisites:

On Ubuntu
```shell
sudo apt install -y bpytop tmux ripgrep exuberant-ctags fzf
```

On Ubuntu 22.04 or other old Linux:
```shell
curl -sSL https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/install | bash
```

## Use

Pull new changes:
```shell
alias chezmoi-pull='chezmoi git pull -- --autostash --rebase && chezmoi diff'
```

Apply changes with `chezmoi apply`.

Bring in new changes and commit:
```shell
chezmoi add ~/.my_config
chezmoi cd
git add dot_my_config
git ci -am 'great config'
git push
```

[User guide](https://www.chezmoi.io/user-guide/command-overview/)
[Reference](https://www.chezmoi.io/reference/)

## TODO
- For `chezmoi-pull`, add prompt to apply the changes
- WSL: vim fix copy-paste to system clipboard
- WSL: tmux hotkeys: v to enter vim mode, v to select, y to copy
- WSL: alacritty add config to chezmoi
- WSL: fix alacritty colors. visual selection in vim in tmux
- Linux: dive into core home archive
- OpenBSD: install & configure ksh, doas, wm
- Ubuntu 22.04: fzf ctrl-r in shell crashes (only if system fzf is installed?)

