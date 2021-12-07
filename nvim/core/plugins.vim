call plug#begin()

" Plug 'Olical/aniseed', { 'tag': 'v3.21.0' }
Plug 'Olical/conjure', { 'for': 'clojure' }
" Plug 'alok/notational-fzf-vim'
Plug 'bling/vim-airline'
" Plug 'cweagans/vim-taskpaper'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'file:///Users/rgm/Projects/foss/alabaster-vim'
Plug 'gcmt/wildfire.vim'
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'janko/vim-test'
Plug 'junegunn/vim-easy-align'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'neovim/nvim-lspconfig'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

call plug#end()

" match clojure-mode.el's and cljfmt's behaviour on (:require\n[foo.bar] ,,,) and cond
let g:clojure_align_subforms = 1
let g:clojure_maxlines = 500
let g:clojure_special_indent_words = 'Given,When,Then'
" let g:clojure_fuzzy_indent = 1
" let g:clojure_align_subforms = 0
let g:clojure_fuzzy_indent_patterns = ['^cond', '^let','^with', '^def', '^comment', '^try']
let g:clojure_align_multiline_strings = 1


let g:ale_sign_column_always = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_linters = {
      \ 'html':        ['prettier'],
      \ 'javascript':  ['eslint', 'prettier'],
      \ 'json':        ['fixjson', 'prettier'],
      \ 'sql':         ['pgformatter'],
      \ 'css':         ['prettier'],
      \ 'clojure':     []
      \}

let g:ale_fixers = {
      \ 'html':       ['prettier'],
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

lua << EOF
require'lspconfig'.clojure_lsp.setup{}
EOF

lua << EOF
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- ..
    color_devicons = true,
    mappings = {
          i = {
                ["<C-q>"] = actions.smart_send_to_qflist,
          },
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
EOF

let g:nv_search_paths = ['~/Documents/Notes']
