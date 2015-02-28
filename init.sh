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
	ln -s -T ~/.fanseashell/vim ~/.vim
fi

vim +PluginInstall +qall
cd ~/.fanseashell/vim/bundle/vimproc.vim
make
