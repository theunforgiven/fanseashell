#!/bin/sh
ln -s ~/.fanseashell/tmux.conf ~/.tmux.conf
ln -s ~/.fanseashell/vimrc ~/.vimrc
ln -s ~/.fanseashell/gitconfig ~/.gitconfig
ln -s -T ~/.fanseashell/vim ~/.vim
cd ~/.fanseashell/vim/bundle/vim-proc 
make
