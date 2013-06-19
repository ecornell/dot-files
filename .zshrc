ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mage"

# CASE_SENSITIVE="true"
# DISABLE_LS_COLORS="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git rbenv)

source $ZSH/oh-my-zsh.sh

export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# alias
alias ls='ls -GFh'

# run OS specific setup 
if [ `uname` "==" "Darwin" ]; then source ~/.zshrc-osx; fi
if [ `uname` "==" "Linux" ]; then source ~/.zshrc-linux; fi

cd ~
