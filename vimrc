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
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pR0Ps/molokai-dark'
Plug 'rgm/vectorscript-vim'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
call plug#end()

" generally matches spacemacs
let mapleader=" "
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>pf :GFiles<CR>
nnoremap <leader>bb :Buffers<CR>

colo molokai-dark

" toggle between file and its alternate
nnoremap <leader><leader> <c-^>

" via http://mixandgo.com/blog/vim-config-for-rails-ninjas
au BufWritePost .vimrc so $MYVIMRC
nnoremap <leader>V :e $MYVIMRC<cr>

nnoremap <silent><leader>\ :nohls<CR>

" open files in directory of current file
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc#L175
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%
map <leader>v :view %%
