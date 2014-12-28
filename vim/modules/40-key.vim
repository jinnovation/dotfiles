let mapleader = "\<Space>"
let maplocalleader = "\\"

nnoremap <S-Enter> O<esc>j
nnoremap <CR> o<Esc>k

" FIXME: doesn't cooperate with tmux
nnoremap <C-Tab> <C-w><C-w>
nnoremap <C-S-Tab> <C-w>W

" TODO: nnoremap <leader>ar to align selection
" TODO: nnoremap <leader>ae to align selection by equal signs

inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h

noremap <Leader>bk :call BKill()<CR>

noremap <Leader>bn :bn<CR>
noremap <Leader>bd :bd<CR>

noremap <Leader>gb :Gblame<CR>
noremap <Leader>gs :Gstatus<CR>

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

map H 0
map L $
inoremap <esc> <nop>

nnoremap <silent> <Leader>rtw :call TrimWhiteSpace()<CR>

nnoremap <leader><C-p> :CtrlPTag<cr>
nnoremap <silent> <leader><C-t> :TagbarToggle<cr>

nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>w :w<cr>
