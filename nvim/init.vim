let mapleader=" "
let maplocalleader=","

call plug#begin()
Plug 'albertorestifo/github.vim'
Plug 'arcticicestudio/nord-vim'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'bling/vim-airline'
Plug 'clojure-vim/vim-jack-in'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
" Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'gcmt/wildfire.vim'
" Plug 'godlygeek/tabular'
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Konfekt/FastFold'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pR0Ps/molokai-dark'
Plug 'rizzatti/dash.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'venantius/vim-cljfmt'

" Plug 'Olical/conjure', { 'tag': 'v1.3.0', 'do': 'bin/compile', 'for': 'clojure', 'on': 'ConjureAdd'  }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'liquidz/vim-iced', {'for': 'clojure'}

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
if iterm_profile == "nord"
  colo nord
  set termguicolors
  hi Folded gui=NONE guifg=#D8DEE9 guibg=#434C5E
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
let g:conjure_log_direction = "horizontal"
let g:conjure_log_size_small = 25
let g:conjure_log_size_large = 50
let g:conjure_quick_doc_normal_mode = 0
let g:conjure_quick_doc_insert_mode = 1
let g:conjure_quick_doc_time = 500
let g:conjure_log_auto_close = 1
let g:conjure_fold_multiline_results = 0
" let g:conjure_log_auto_open = ['eval', 'ret', 'ret-multiline', 'out', 'err', 'tap', 'doc', 'load-file', 'test']
let g:conjure_log_auto_open = ['doc', 'test', 'err']
augroup additional_conjure_bindings
  autocmd!
  autocmd FileType clojure nnoremap <buffer> <localleader>cr  :ConjureRemoveAll<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>rr  :!afza<cr>
augroup END

let g:clojure_align_multiline_strings = 1
let g:clj_fmt_autosave = 0

" reload config on save
au BufWritePost init.vim so ~/.config/nvim/init.vim
nnoremap <leader>V :vsplit ~/.config/nvim/init.vim<cr>

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

let g:ale_linters = {
      \ 'html':        ['htmlhint', 'tidy'],
      \ 'javascript':  ['eslint', 'prettier'],
      \ 'json':        ['fixjson', 'prettier'],
      \ 'sql':         ['pgformatter'],
      \ 'clj':         ['joker', 'clj-kondo']
      \}

let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'json':       ['fixjson', 'prettier'],
      \ 'css':        ['prettier'],
      \ 'scss':       ['prettier'],
      \ 'ruby':       ['rubocop'],
      \ 'sh':         ['shfmt'],
      \ 'python':     ['black']
      \}

let g:rainbow_active = 1
set diffopt+=vertical

" Terminal buffer options for fzf
" see https://github.com/junegunn/dotfiles/blob/9545174d0e34075d16c1d6a01eed820bce9d6cc0/vimrc#L1657-L1686
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=20

  hi NormalFloat guibg=None
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    let $FZF_DEFAULT_OPTS .= ' --border'
  endif

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" Identify syntax group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" https://github.com/junegunn/vim-easy-align#quick-start-guide
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" https://www.hillelwayne.com/post/vim-macro-trickz/
nnoremap Q @@
set lazyredraw
nnoremap Y y$

" grep out all the code notes like FIXME, etc
fun! s:FIXME(txt)
  Rg -s "\bFIXME\b\|\bTODO\b" src test
endfun
command! FIXME :call s:FIXME(<q-args>)

"https://dmoerner.wordpress.com/2017/08/14/vimwiki-and-git-autocommit/
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
augroup vimwiki
au! BufWritePost ~/Documents/vimwiki/* !git add "%";git commit -m "Auto commit of %:t." "%"
augroup END
