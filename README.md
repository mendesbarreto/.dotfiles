## My Public Dot files

### Setup Git Bare
[Git work-tree](https://davidinformatico.com/dotfiles-saving-strategy) 

```shell
$ git clone --bare git@github.com:mendesbarreto/.dotfiles.git $HOME/.config
$ git --local status.showUntrackedFiles no
```

```shell
# Add to zshrc
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
```

### Setup Tmux

```shell
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ git clone --single-branch https://github.com/gpakosz/.tmux.git "Git/tmux"
$ ln -s /path/to/oh-my-tmux/.tmux.conf ~/.config/tmux/tmux.conf
$ cp /path/to/oh-my-tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local
```


