#!/bin/sh

if [ ! \( -e "${HOME}/.tmux.conf" \) ]; then
	echo 'linking ~/.fanseashell/tmux.conf ~/.tmux.conf'
	ln -s ~/.fanseashell/tmux.conf ~/.tmux.conf
fi

if [ ! \( -e "${HOME}/.tmux" \) ]; then
	echo 'linking ~/.fanseashell/tmux ~/.tmux'
	ln -s ~/.fanseashell/tmux ~/.tmux
fi

if [ ! \( -e "${HOME}/.vimrc" \) ]; then
	echo 'linking ~/.fanseashell/vimrc ~/.vimrc'
	ln -s ~/.fanseashell/vimrc ~/.vimrc
fi

if [ ! \( -e "${HOME}/.gitconfig" \) ]; then
	echo 'linking ~/.fanseashell/gitconfig ~/.gitconfig'
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

if [ ! \( -e "${HOME}/.zsh" \) ]; then
	echo 'linking ~/.fanseashell/zsh ~/.zsh'
	ln -s ~/.fanseashell/zsh ~/.zsh
fi

if [ ! \( -e "${HOME}/.zshenv" \) ]; then
	echo 'linking ~/.fanseashell/zshenv_shim ~/.zshenv'
	ln -s ~/.fanseashell/zshenv_shim ~/.zshenv
fi

~/.vim/bundle/neobundle.vim/bin/neoinstall
