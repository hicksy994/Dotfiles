# Path to your oh-my-zsh installation.
export ZSH=/home/hicksy/.oh-my-zsh

#DONT TOUCH THIS WHATEVER YOU DO BAD THINGS WILL HAPPEN
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

#theme
# ZSH_THEME="lambda-mod"
ZSH_THEME="agnoster"

#vi keys
bindkey -v

#plugins
plugins=(git vi-mode tmux)

source $ZSH/oh-my-zsh.sh

alias springproject='cd projects/CO2006/co2006-16-17-hicksy994/sprint2/mini-project'
alias springproject2='cd projects/CO2006/co2006-16-17-hicksy994/sprint3/mini-project2'
