let mapleader=" "
let maplocalleader=","

nnoremap <leader>V :e ~/.config/nvim/init.vim<cr>

nnoremap <silent><leader>\ :nohls<cr>
nnoremap <silent><leader>h :Dash<cr>
nnoremap <silent><leader>W :StripWhitespace<cr>

nnoremap <leader>g :vert Gstatus<CR>
" https://www.hillelwayne.com/post/vim-macro-trickz/
nnoremap Q @@
nnoremap Y y$


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)

" fugitive
nnoremap <silent> <Leader>g   :Git<cr>
nnoremap <silent> <Leader>gb  :Git blame<cr>
nnoremap <silent> <Leader>gca :Git commit --all --verbose<cr>
nnoremap <silent> <Leader>gcc :Git commit --verbose<cr>
nnoremap <silent> <Leader>gf  :Git fetch<cr>
nnoremap <silent> <Leader>gi  :Git diff<cr>
nnoremap <silent> <Leader>gl  :Git pull<cr>
nnoremap <silent> <Leader>gp  :Git push<cr>
nnoremap <silent> <Leader>gs  :Git status<cr>

" fuzzy finding
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <Leader>rg <cmd>Telescope grep_string<cr>
