set nocompatible
filetype off

let has_vundle=1
if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")
     echo "Installing Vundle..."
     echo ""
     silent !mkdir -p $HOME/.vim/bundle
     silent !git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
     let has_vundle=0
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/SudoEdit.vim'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhinz/vim-startify'

" All of your Plugins must be added before the following line
call vundle#end()

if has_vundle == 0
    :silent! PluginInstall
    :qa
endif


" UI Setup
filetype plugin indent on
syntax enable
colors jellybeans
set background=dark
if (&term =~ "xterm") || (&term =~ "screen")
	set t_Co=256
endif

set cursorline
set more
set number
set showcmd
set title


" General Settings
set hidden
set history=1000
set noexrc
set nostartofline
set shortmess+=I
set ttyfast

set gdefault 
set incsearch

set nobackup
set autoread
set autochdir
set confirm

set autoindent
set backspace=indent,eol,start
set cinkeys-=0#
set expandtab
set ignorecase
set shiftround
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4


if has("mouse")
  set mouse=a
endif

" mappings
imap jj <esc>
