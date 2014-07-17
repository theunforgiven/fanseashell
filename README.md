Fanseashell
===========

Repository to hold my tmux/vim/bash configuration files.


# Installation
    git clone git@github.com:theunforgiven/fanseashell.git ~/.fanseashell
    echo source ~/.fanseashell/bash_custom >> ~/.bashrc
    ~/.fanseashell/init.sh

## Install Notes
When the init.sh script is executed the following symlinks are created:
*  ~/.fanseashell/vimrc to ~/.vimrc
*  ~/.fanseashell/tmux.conf to ~/.tmux.conf
*  ~/.fanseashell/gitconfig to ~/.gitconfig
*  ~/.fanseashell/vim to ~/.vim.

## Windows Notes
* You will need to set the terminal type string in Connection->Data to 'xterm-256color' otherwise tmux has issues
* Vimproc will need to be build on windows see [vimproc.vim](https://github.com/Shougo/vimproc.vim)

# Screenshots
![Bash And Tmux](https://github.com/theunforgiven/fanseashell/raw/master/screenshots/bashAndTmux.png)
![Vim And Tmux](https://github.com/theunforgiven/fanseashell/raw/master/screenshots/vimAndTmux.png)
