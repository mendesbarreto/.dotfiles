### My Dear Public Dot files

This project should be use as a bare repo with git to download the dot files to a Unix based machine.

### Instalation

```shell
git init --bare $HOME/.config/
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
config config --local status.showUntrackedFiles no
config add .vimrc + config commit -m "add .vimrc" + set up a remote repository on GitHub or your Git server of choice + config push
```
