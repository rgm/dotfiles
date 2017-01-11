set autoread " kill git 'file has changed' prompts
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set expandtab
set hidden
set history=10000
set hlsearch
set ignorecase smartcase
set incsearch
set infercase
set nobackup
set nocompatible
set noswapfile
set ruler
set showcmd
set splitbelow
set splitright
set tabstop=2 shiftwidth=2 softtabstop=2
set title
set undolevels=1000
set visualbell
set winwidth=99

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rgm/vectorscript-vim'
call vundle#end()
filetype plugin indent on
syntax on
