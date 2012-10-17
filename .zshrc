ZSH=$HOME/.oh-my-zsh

ZSH_THEME="blinks"

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=~/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
