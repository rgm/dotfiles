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
Plug 'vim-syntastic/syntastic'
Plug 'pR0Ps/molokai-dark'
Plug 'rgm/vectorscript-vim'
Plug 'airblade/vim-gitgutter'
Plug 'gcmt/wildfire.vim'
Plug 'pangloss/vim-javascript'
Plug 'rizzatti/dash.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fireplace'
" Plug 'guns/vim-sexp'
Plug 'vim-scripts/paredit.vim'
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
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

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" ,h to lookup help in dash
nnoremap ,h :Dash<CR>

" kill trailing whitespace
autocmd Syntax * syn match ExtraWhiteSpace /\s\+$\| \+\ze\t/ containedin=ALL
highlight ExtraWhiteSpace ctermbg=red guibg=red
nnoremap <silent> <leader>W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" kill other windows with <leader>o
nnoremap <leader>o <C-W>o<CR>

au BufEnter *.clj RainbowParenthesesActivate
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces
