# My Public Dot files

## Dot files 
[Git work-tree](https://davidinformatico.com/dotfiles-saving-strategy) 

#### Clone dot files
```shell
$ git clone --bare git@github.com:mendesbarreto/.dotfiles.git $HOME/.config
```

#### Add Alias to .zshrc
```shell
# Add to zshrc
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
```

#### Check and Ignore not added files

```shell
config checkout -f
config config --local status.showUntrackedFiles no
```

## Tmux

```shell
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ git clone --single-branch https://github.com/gpakosz/.tmux.git "Git/tmux"
$ ln -s /path/to/oh-my-tmux/.tmux.conf ~/.config/tmux/tmux.conf
$ cp /path/to/oh-my-tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local
```


