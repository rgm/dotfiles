" all below in vim-sensible
set autoread " kill git 'file has changed' prompts
" set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set expandtab
set history=10000
set hidden " switch away from unsaved buffers
set hlsearch
set incsearch
set ignorecase smartcase
set infercase
set nobackup
set noswapfile
" set ruler
set showcmd
set splitbelow
set splitright
set tabstop=2 shiftwidth=2 softtabstop=2
set title
" set undolevels=1000
" set visualbell
set winwidth=90
"
" set backupdir=./.backup,.,/tmp
" set directory=.,./.backup,/tmp

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'sheerun/vim-polyglot'
" Plug 'Konfekt/FastFold'
" Plug 'flazz/vim-colorschemes'
" Plug 'scrooloose/nerdtree'
Plug 'justinmk/vim-sneak'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'

Plug '~/Projects/splitjoin.vim'
Plug 'PeterRincker/vim-argumentative'
" Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'airblade/vim-gitgutter'
" Plug 'benmills/vimux'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'guns/vim-sexp'
" Plug 'bhurlow/vim-parinfer'
" Plug 'keith/swift.vim', { 'for': 'swift' }
" Plug 'gabrielelana/vim-markdown'
Plug 'cakebaker/scss-syntax.vim'
Plug 'luochen1990/rainbow'
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
" Plug 'jsx/jsx.vim'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'burnettk/vim-angular'
Plug 'ternjs/tern_for_vim'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'rgm/vectorscript-vim'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'venantius/vim-cljfmt'
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
" Plug 'SevereOverfl0w/clojure-check', {'do': './install'}
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fireplace' ", { 'for': 'clojure' }
" Plug 'SevereOverfl0w/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
" Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
Plug 'tweekmonster/django-plus.vim'
Plug 'christoomey/vim-conflicted'

Plug 'chrisbra/nrrwrgn'
Plug 'jceb/vim-orgmode'

 " colorschemes
Plug 'lifepillar/vim-solarized8'
Plug 'albertorestifo/github.vim'
Plug 'pR0Ps/molokai-dark'

call plug#end()

" colo molokai-dark
" colo github

" generally matches spacemacs
let mapleader=" "
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>pf :GFiles<CR>
nnoremap <leader>pF :GFiles?<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>mm :Marks<CR>
nnoremap <leader>c :BCommits<CR>
nnoremap <leader>C :Commits<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>T :Tags<CR>

nnoremap <leader>gs :Gstatus<CR>

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

" ag.vim -> ack so we can go through quickfix instead of fzf
" let g:ackprg = 'ag --vimgrep --smart-case'
let g:ackprg = 'ag --vimgrep --no-heading'

let g:rainbow_active = 1

" move through quickfix list
nnoremap [ :cp<CR>
nnoremap ] :cn<CR>

let g:dash_map = {
      \ 'clojure' : ['cljs', 'clojure', 'goog']
      \ }

command! Figapp :Piggieback! (figwheel-sidecar.repl-api/repl-env "app")
command! Figdevcard :Piggieback! (figwheel-sidecar.repl-api/repl-env "devcards")
command! Figchestnut :Piggieback (figwheel-sidecar.system/repl-env (:figwheel-system reloaded.repl/system) nil)

let maplocalleader=","

" clojure indentation
" let g:clojure_maxlines = 200
let g:clojure_align_multiline_strings = 1

" color switch on iterm profile
let iterm_profile = $ITERM_PROFILE
if iterm_profile == "light"
  colo github
  " https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
  highlight SignColumn ctermbg=white
  " highlight GitGutterAdd ctermfg=green
  " highlight GitGutterChange ctermfg=blue
  " highlight GitGutterDelete ctermfg=red
  " highlight GitGutterChangeDelete ctermfg=magenta
  highlight Folded ctermbg=255 ctermfg=17
  highlight CursorLine ctermbg=193
elseif iterm_profile == "solarized-light"
  let g:solarized_use16 = 1
  set background=light
  colo solarized8
elseif iterm_profile == "solarized-dark"
  let g:solarized_use16 = 1
  set background=dark
  colo solarized8
else
  colo molokai-dark
  " colo molokai
  hi SignColumn ctermbg=black
  hi GitGutterAdd ctermbg=black ctermfg=green
  hi GitGutterChange ctermbg=black ctermfg=blue
  hi GitGutterDelete ctermbg=black ctermfg=red
  hi GitGutterChangeDelete ctermbg=black ctermfg=magenta

  hi DiffAdd      ctermbg=22 ctermfg=15
  hi DiffChange   ctermbg=17 ctermfg=15
  hi DiffText     ctermbg=21 ctermfg=15
  hi DiffDelete   ctermbg=52 ctermfg=15
endif

" always show ale/gitgutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
let g:ale_sign_column_always = 1

let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

let g:ale_linters = {
      \ 'html': ['htmlhint', 'tidy'],
      \ 'javascript': ['eslint'],
      \}

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fix_on_save = 1

" see https://github.com/tpope/vim-fireplace/pull/301/files
" let g:fireplace_pprint_fn = 'clojure.pprint/pprint'
" let g:fireplace_pprint_fn = 'cider.nrepl.middleware.pprint/fipp-pprint'
" let g:fireplace_pprint_fn = 'cider.nrepl.middleware.pprint/puget-pprint'
"
" set foldmethod=syntax
set diffopt+=vertical

" command Greview :Git! diff --staged
nnoremap <leader>gr :Greview<cr>

nnoremap <LocalLeader>f :set foldmethod=syntax<CR>

" wrap diff always
" https://stackoverflow.com/a/17329864/53790
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

autocmd FileType terraform setlocal commentstring=#\ %s

let g:rainbow_conf = {'ctermfgs': ['Blue', 'Green', 'DarkMagenta', 'DarkRed']}

" https://www.hillelwayne.com/post/vim-macro-trickz/
nnoremap Q @@
set lazyredraw
nnoremap Y y$

let g:sneak#s_next = 1
let g:sneak#label = 1

nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
