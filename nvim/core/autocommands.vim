au BufWritePost init.vim so ~/.config/nvim/init.vim

" https://twitter.com/hillelogram/status/1448309762324668425
" au InsertEnter * set norelativenumber number
" au InsertLeave * set relativenumber
" au CmdLineEnter * set norelativenumber number | redraw
" au CmdlineLeave * set relativenumber

" https://blog.kdheepak.com/three-built-in-neovim-features.html#highlight-yanked-text
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
