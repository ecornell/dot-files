autoload colors; colors

source ~/.antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/

antigen theme ecornell/oh-my-zsh themes/mage  

antigen bundle git
antigen bundle rupa/z
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# CASE_SENSITIVE="true"
# DISABLE_LS_COLORS="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# alias
alias ls='ls -GFh'
alias vi='vim'

# run OS specific setup 
if [ `uname` "==" "Darwin" ]; then 
    source ~/.zshrc-osx;
    antigen bundle brew
    antigen bundle brew-cask
    antigen bendle osx
elif [ `uname` "==" "Linux" ]; then 
    source ~/.zshrc-linux; 
fi

cd ~
