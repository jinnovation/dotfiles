nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

let mapleader = "\<Space>"
let maplocalleader = "\\"

nnoremap ; :

nnoremap <leader><CR> O<esc>j
nnoremap <CR> o<Esc>k

" FIXME: doesn't cooperate with tmux
nnoremap <C-Tab> <C-w><C-w>
nnoremap <C-S-Tab> <C-w>W

" TODO: nnoremap <Leader>ar to align selection
" TODO: nnoremap <Leader>ae to align selection by equal signs

inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h
inoremap <M-b> <C-o>b

noremap <Leader>bk :call BKill()<CR>

" buffer controls
noremap <Leader>bn :bn<CR>
noremap <Leader>bd :bd<CR>
" TODO: <Leader>bK killall buffers

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

nnoremap <silent> <Leader>rtw :call TrimWhiteSpace()<CR>

nnoremap <Leader><C-p> :CtrlPTag<cr>
nnoremap <silent> <Leader><C-t> :TagbarToggle<cr>

nnoremap <Leader>sv :source $MYVIMRC<cr>

nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>pwd :pwd<cr>

 " alternate between last two files
nnoremap <Leader><Leader> <c-^>

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9

" indent/align entire document
nnoremap <Leader>== gg=G``

imap <localleader>cI <Plug>NERDCommenterInsert

nnoremap <leader><f2> :CottidieTip<cr>

nnoremap <leader>csf :/=\+\s\+evaluation/,$s/\s\/\s\?\([0-9]\+\)/\1\/\1/g<cr>
nnoremap <leader>csz :/=\+\s\+evaluation/,$s/\s\/\s\?\([0-9]\+\)/0\/\1/g<cr>
nnoremap <leader>css :call CSSignature()<CR>
nnoremap <leader>css :%s/GRADER'S_NAME_HERE/Jonathan Jin/<cr>
