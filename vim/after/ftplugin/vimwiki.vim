setlocal spell
set spelllang+=sciUS

"voom
nnoremap <leader>vo :Voom vimwiki<CR>

"calendar
nnoremap <leader>ca :Calendar<CR>

"write current date
nnoremap <leader>da i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
nnoremap <leader>dt i<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>

set noswapfile
