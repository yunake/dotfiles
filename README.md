## Install

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply yunake
```

### Tools & prerequisites:

On Ubuntu
```shell
sudo apt install -y bpytop tmux ripgrep exuberant-ctags fzf bat bat-extra rage jq yq curlie httpie sd fd procs dust duf bandwidth doggo yazi devbox just mods zoxide xh hwatch eza broot yazi choose
dpkg -i https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb
dpkg -i https://github.com/ms-jpq/sad/releases/latest/download/x86_64-unknown-linux-gnu.deb
```

On Ubuntu 22.04 or other old Linux:
```shell
curl -sSL https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/install | bash
```

## Use

Pull new changes from remote:
```shell
alias chezmoi-pull='chezmoi git pull -- --autostash --rebase && chezmoi diff'
```

Check and apply changes from local repo to your $HOME with `chezmoi diff` and `chezmoi apply`.

Bring in new changes from $HOME to local repo and commit:
```shell
chezmoi add ~/.my_config
chezmoi cd
git add dot_my_config
git ci -am 'great config'
git push
```

1. [User guide](https://www.chezmoi.io/user-guide/command-overview/)
2. [Reference](https://www.chezmoi.io/reference/)
3. [Examples](https://www.chezmoi.io/links/dotfile-repos/)

## TODO
- For `chezmoi-pull`, add prompt to apply the changes
- Darwin: add terminal colors configs
- Darwin: audit and add other configs
- Darwin: in vim, visual selection color is solid, likely due to lack of true colors? 
- WSL: vim fix copy-paste to system clipboard
- WSL: tmux copy-paste to system clipboard works in Windows Terminal but not in Alacritty
- WSL: alacritty add config to chezmoi
- WSL: alacritty & Windows Terminal fix colors. visual selection in vim
- WSL: Windows Terminal settings & colors
- WSL: autohotkey scripts
- Linux: dive into `core` home archive:
    - vim
    - `.config`
    - `~/bin`
- OpenBSD: install & configure ksh, doas, wm
- Ubuntu 22.04: fzf ctrl-r in shell crashes (only if system fzf is installed?)
- Tools: structured installs across various platforms
- Tools: add more tools: jq, yq, mlr, fd, direnv
- Tools: ssh compatible crossplatform notify (`.bash_darwin` -> `notifyDone`, `.bash_linux` -> `alert`)
- Tools: integrate notify https://github.com/Bash-it/bash-it/blob/master/plugins/available/cmd-returned-notify.plugin.bash
- Bash: notify on long-running jobs, determine via https://github.com/rcaloras/bash-preexec
- Browsers: one config for vim keys configs in Zen, Safari, Edge
- Security: implement encrypted tokens and certificates
- Fonts: nerd fonts, unify mono fonts across systems
- nvim for markdown https://youtu.be/TrbZlA4UIFU
- yazi file manager
- tmux status line time & kb layout, battery on wsl
- tmux copy-paste using Terminal escape sequences over ssh
- Keyboard: design layout [./keyboard]
- Keyboard: kanata config for laptop keyboard, autodetect external keyboard
- Git commit signing, requires gpg keys https://github.com/codingjerk/dotfiles?tab=readme-ov-file#optional-extra-steps-on-new-hosts
