export LANG=en_US.UTF-8

. "$HOME/.local/bin/env"
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=100000

# Add /usr/local/bin to PATH
export PATH="/usr/local/bin:$PATH"

# History configuration
HISTSIZE=10000                  # Number of commands in memory
HISTFILESIZE=20000              # Number of commands in history file
HISTCONTROL=ignoreboth:erasedups # Ignore duplicates and commands starting with space
HISTIGNORE='ls:ll:cd:pwd:bg:fg:history' # Don't save simple commands
shopt -s histappend             # Append to history file, don't overwrite
shopt -s cmdhist                # Save multi-line commands as one command

# Prompt customization
# Format: [user@host dir]$
# Colors: green user@host, blue directory
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# ls aliases with color and formatting
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lhtr'  # Sort by modification time, newest last

# Safety aliases - confirm before overwrite/delete
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Disk usage helpers
alias df='df -h'
alias du='du -h'
alias ducks='du -cks * | sort -rn | head'  # Show largest directories

# Process helpers
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'  # Quick process search

# Network helpers
alias ports='netstat -tulanp'
alias myip='curl -s ifconfig.me'

# System info
alias meminfo='free -h'
alias cpuinfo='lscpu'

# Git shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

# Useful functions

# Make directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract various archive types
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"    ;;
            *.tar.gz)    tar xzf "$1"    ;;
            *.bz2)       bunzip2 "$1"    ;;
            *.rar)       unrar x "$1"    ;;
            *.gz)        gunzip "$1"     ;;
            *.tar)       tar xf "$1"     ;;
            *.tbz2)      tar xjf "$1"    ;;
            *.tgz)       tar xzf "$1"    ;;
            *.zip)       unzip "$1"      ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1"       ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find file by name
ff() {
    find . -type f -iname "*$1*"
}

# Find directory by name
fd() {
    find . -type d -iname "*$1*"
}

# Quick backup of a file
backup() {
    cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
}

# Show PATH entries one per line
path() {
    echo "$PATH" | tr ':' '\n'
}
