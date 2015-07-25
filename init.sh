#!/bin/sh

if [ ! \( -e "${HOME}/.tmux.conf" \) ]; then
	ln -s ~/.fanseashell/tmux.conf ~/.tmux.conf
fi

if [ ! \( -e "${HOME}/.vimrc" \) ]; then
	ln -s ~/.fanseashell/vimrc ~/.vimrc
fi

if [ ! \( -e "${HOME}/.gitconfig" \) ]; then
	ln -s ~/.fanseashell/gitconfig ~/.gitconfig
fi

if [ ! \( -e "${HOME}/.vim" \) ]; then
	echo 'linking ~/.fanseashell/vim ~/.vim'
	ln -s ~/.fanseashell/vim ~/.vim
fi

if [ ! \( -e "${HOME}/.bash_custom" \) ]; then
	echo 'linking ~/.fanseashell/bash_custom ~/.bash_custom'
	ln -s ~/.fanseashell/bash_custom ~/.bash_custom
fi
~/.vim/bundle/neobundle.vim/bin/neoinstall
