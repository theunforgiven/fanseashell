#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

ssh-add -A &> /dev/null

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

if { [ "$TERM" = "screen-256color" ] && [ -n "$TMUX" ]; } then
	#if in tmux load up fancy promptline
	source ~/.fanseashell/fancy/promptline.sh
fi

source ~/.fanseashell/common

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
