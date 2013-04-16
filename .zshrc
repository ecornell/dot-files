ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mage"

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git rbenv)

source $ZSH/oh-my-zsh.sh

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH

. ~/.nvm/nvm.sh
nvm use 0.8.12 > /dev/null

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

. `brew --prefix`/etc/profile.d/z.sh



alias ls='ls -GFh'

cd ~
