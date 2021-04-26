let mapleader=" "
let maplocalleader=","

call plug#begin()

" colors
" Plug 'Konfekt/FastFold'
" Plug 'albertorestifo/github.vim'
" Plug 'chrisbra/unicode.vim'
" Plug 'habamax/vim-asciidoctor'
" Plug 'luochen1990/rainbow'
Plug 'altercation/vim-colors-solarized'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
" Plug 'chrisbra/csv.vim'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'gcmt/wildfire.vim'
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'honza/vim-snippets'
Plug 'janko/vim-test'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-emoji'
Plug 'jvirtanen/vim-hcl'
Plug 'kshenoy/vim-signature'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'pR0Ps/molokai-dark'
Plug 'preservim/tagbar'
Plug 'rizzatti/dash.vim'
Plug 'sheerun/vim-polyglot'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" Plug 'clojure-vim/vim-jack-in'
" Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'SevereOverfl0w/vim-replant', { 'for': 'clojure', 'do': ':UpdateRemotePlugins' }
Plug 'Olical/conjure', { 'for': 'clojure', 'branch': 'develop' }

Plug 'file:///Users/rgm/Projects/foss/alabaster-vim'
Plug 'file:///Users/rgm/Projects/foss/vectorscript-vim'

call plug#end()

set cursorline
set diffopt+=vertical
set encoding=utf-8
set hidden " allow switching away from unsaved buffers
set history=10000
set hlsearch
set ignorecase smartcase
set lazyredraw " https://www.hillelwayne.com/post/vim-macro-trickz/
set incsearch
set nobackup
set noswapfile
set nonumber
set showcmd
set splitbelow
set splitright
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set termguicolors

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType clojure setlocal shiftwidth=2 tabstop=2 softtabstop=2

" color switch on iterm profile
let iterm_profile = $ITERM_PROFILE
if iterm_profile == "github"
  " colo github
  colo alabaster-light
  " hi DiffChange gui=none guifg=#cae2ff guibg=#3b4e66
  " hi DiffText   gui=bold guifg=#ffffff guibg=#0072ff
  " hi DiffAdd    gui=none guibg=#e6ffed
  " hi DiffDelete gui=none guibg=#ffeef0
  " hi Keyword    gui=none guifg=#dddddd
else
  colo alabaster-dark
  " Nord inspired diff colouring
  " hi DiffChange gui=none guifg=#cae2ff guibg=#3b4e66
  " hi DiffText   gui=bold guifg=#ffffff guibg=#0072ff
  " hi DiffAdd    gui=none guibg=#41592d guifg=#c5e6a9
  " hi DiffDelete gui=none guibg=#663439 guifg=#e6757f
  " hi Keyword    gui=none guifg=#dddddd
endif

nnoremap <silent><leader>\ :nohls<cr>
nnoremap <silent><leader>h :Dash<cr>
nnoremap <silent><leader>W :StripWhitespace<cr>

" FZF, generally trying to match spacemacs
nnoremap <leader>ff :FZF<CR>
" nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>pp :GFiles?<CR>
nnoremap <leader>hh :History<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>mm :Marks<CR>
nnoremap <leader>bc :BCommits<CR>
nnoremap <leader>pc :Commits<CR>
nnoremap <leader>bt :BTags<CR>
nnoremap <leader>tt :Tags<CR>
nnoremap <leader>bl :BLines<CR>
nnoremap <leader>gs :vert Gstatus<CR>

" https://www.hillelwayne.com/post/vim-macro-trickz/
nnoremap Q @@
nnoremap Y y$

" match clojure-mode.el's and cljfmt's behaviour on (:require\n[foo.bar] ,,,) and cond
let g:clojure_align_subforms = 1
let g:clojure_maxlines = 200
let g:clojure_special_indent_words = 'Given,When,Then'
" let g:clojure_fuzzy_indent = 1
" let g:clojure_align_multiline_strings = 1
" let g:clojure_align_subforms = 0
let g:clojure_fuzzy_indent_patterns = ['^cond', '^let','^with', '^def', '^comment']
let g:clojure_align_multiline_strings = 1

let g:rg_highlight = 1

" conjure
augroup additional_conjure_bindings
  autocmd!
  autocmd FileType clojure nnoremap <buffer> <localleader>cr  :ConjureRemoveAll<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>rr  :!afza<cr>
augroup END
let g:conjure_config = {"log.hud.passive-close-delay": 1000}

let g:clj_fmt_autosave = 0

" reload nvim config on save
au BufWritePost init.vim so ~/.config/nvim/init.vim
nnoremap <leader>V :vsplit ~/.config/nvim/init.vim<cr>

nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)

let g:ale_sign_column_always = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

let g:ale_linters = {
      \ 'html':        ['prettier', 'htmlhint', 'tidy'],
      \ 'javascript':  ['eslint', 'prettier'],
      \ 'json':        ['fixjson', 'prettier'],
      \ 'sql':         ['pgformatter'],
      \ 'css':         ['prettier'],
      \ 'clojure':     ['clj-kondo']
      \}

let g:ale_fixers = {
      \ 'html':       ['prettier', 'htmlhint', 'tidy'],
      \ 'svg':        ['htmlhint', 'tidy'],
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'json':       ['fixjson', 'prettier'],
      \ 'css':        ['prettier'],
      \ 'scss':       ['prettier'],
      \ 'ruby':       ['rubocop'],
      \ 'sh':         ['shfmt'],
      \ 'python':     ['black']
      \}


" Identify syntax group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" https://github.com/junegunn/vim-easy-align#quick-start-guide
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" which-key
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" set timeoutlen=500

" vim-test
nnoremap <localleader>tl :TestLast<cr>
nnoremap <localleader>tn :TestNearest<cr>
nnoremap <localleader>tf :TestFile<cr>
" let test#strategy = "neovim"
let test#neovim#term_position = "vert"

" https://blog.kdheepak.com/three-built-in-neovim-features.html
set inccommand=nosplit
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" hard mode, see https://github.com/takac/vim-hardtime
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 1
let g:list_of_normal_keys = ["h", "j", "k", "l",  ]
let g:list_of_visual_keys = ["h", "j", "k", "l",  ]
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = []

" clojure-lsp and CoC
" https://clojure-lsp.github.io/clojure-lsp/clients/#vim

function! Expand(exp) abort
  let l:result = expand(a:exp)
  return l:result ==# '' ? '' : "file://" . l:result
endfunction

" Highlight symbol under cursor on CursorHold      
autocmd CursorHold * silent call CocActionAsync('highlight')
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

nnoremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crth :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtt :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtl :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cruw :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-thread', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crua :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcp :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-privacy', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cris :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'inline-symbol', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>aq  <Plug>(coc-fix-current)
" workspace symbols 
nnoremap <silent><leader>s  :<C-u>CocList -I symbols<cr>

autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call s:LoadClojureContent(expand("<amatch>"))
function! s:LoadClojureContent(uri)
  setfiletype clojure
  let content = CocRequest('clojure-lsp', 'clojure/dependencyContents', {'uri': a:uri})
  call setline(1, split(content, "\n"))
  setl nomodified
  setl readonly
endfunction

nmap <silent> <Leader>cr            <Plug>(coc-rename)
nmap <silent> <Leader>cf            <Plug>(coc-references)
xmap <silent> <Leader>c             <Plug>(coc-codeaction-selected)
nmap <silent> <Leader>c             <Plug>(coc-codeaction-line)
nmap <silent> gd                    <Plug>(coc-definition)

" Don't fold anything.
autocmd BufWinEnter * set foldlevel=999999
