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

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'rgm/vectorscript-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pR0Ps/molokai-dark'
call plug#end()

" generally matches spacemacs
let mapleader=" "
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>pf :GFiles<CR>
nnoremap <leader>bb :Buffers<CR>

colo molokai-dark
