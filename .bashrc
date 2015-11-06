#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\e[01;35m\]\u\[\e[0m\]\[\e[01;37m\]@\[\033[1;34m\]\h\[\e[0m\]\[\e[00;37m\]:\w \[\e[0m\]\[\e[00;36m\]$?\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[01;37m\]\n$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]'

# i3lock
alias lock='. ~/lock.sh'

# thefuck
eval $(thefuck --alias)

# cheat sheet
alias cheat='~/Go/bin/cheat'

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
[[ -s "/home/lo/.gvm/scripts/gvm" ]] && source "/home/lo/.gvm/scripts/gvm"
