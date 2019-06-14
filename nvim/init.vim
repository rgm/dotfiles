let mapleader=" "
let maplocalleader=" "

call plug#begin()
Plug 'albertorestifo/github.vim'
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'ntpeters/vim-better-whitespace'
Plug 'majutsushi/tagbar'
Plug 'Olical/conjure', { 'tag': 'v0.18.0', 'do': 'bin/compile', 'for': 'clojure', 'on': 'ConjureAdd'  }
Plug 'mhinz/vim-signify'
Plug 'pR0Ps/molokai-dark'
Plug 'rizzatti/dash.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'
call plug#end()

set cursorline
set encoding=utf-8
set history=10000
set hidden " switch away from unsaved buffers
set hlsearch
set ignorecase smartcase
set incsearch
set nobackup
set noswapfile
set showcmd
set splitbelow
set splitright
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

let iterm_profile = $ITERM_PROFILE
if iterm_profile == "dark"
  colo molokai-dark
else
  colo github
endif

let g:ale_sign_column_always = 1

nnoremap <silent><leader>\ :nohls<cr>
nnoremap <silent><leader>h :Dash<cr>
nnoremap <silent><leader>W :StripWhitespace<cr>

" FZF, generally trying to match spacemacs
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fF :Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>pf :GFiles<CR>
nnoremap <leader>gf :GFiles?<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>mm :Marks<CR>
nnoremap <leader>bc :BCommits<CR>
nnoremap <leader>pc :Commits<CR>
nnoremap <leader>bt :BTags<CR>
nnoremap <leader>tt :Tags<CR>
nnoremap <leader>gs :vert Gstatus<CR>

" match clojure-mode.el's and cljfmt's behaviour on (:require\n[foo.bar...
let g:clojure_align_subforms = 1

let g:rg_highlight = 1

" conjure
" let g:conjure_log_direction = "horizontal"
let g:conjure_log_size_small = 10
let g:conjure_log_size_large = 50
augroup additional_conjure_bindings
  autocmd!
  autocmd FileType clojure nnoremap <buffer> <localleader>caj :ConjureAdd {:tag :jvm :port 5555 :lang :clj}<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>can :ConjureAdd {:tag :node :port 5556 :lang :cljs}<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>cab :ConjureAdd {:tag :browser :port 5557 :lang :cljs}<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>cab :ConjureAdd {:tag :figwheel :port 5558 :lang :cljs}<cr>

  autocmd FileType clojure nnoremap <buffer> <localleader>cr :ConjureRemoveAll<cr>

  autocmd FileType clojure nnoremap <buffer> <localleader>rr :!afza<cr>
augroup END


" reload config on save
au BufWritePost init.vim so ~/.config/nvim/init.vim
nnoremap <leader>V :vsplit ~/.config/nvim/init.vim<cr>
