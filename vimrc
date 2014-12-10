set exrc   " force vim to source vimrc file if present in working dir
set secure " restrict usage of some commands in non-default vimrc files

if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

if filereadable(expand("~/.vim/fn.vim"))
  source ~/.vim/fn.vim
endif

let mapleader = ","
let maplocalleader = "\\"

set scrolloff=3

set textwidth=80

" search
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase

" interface
set splitbelow
set splitright
set colorcolumn = 80
set number

" editing
set expandtab
set autoindent
set smartindent
set cindent
set shiftwidth=2

set cursorline

set shortmess+=I

set autochdir

set visualbell

set ai

syntax on
nmap <S-Enter> O<esc>j
nmap <CR> o<Esc>k
nmap <C-Tab> <C-w><C-w>
nmap <C-S-Tab> <C-w>W

" TODO: nmap <leader>ar to align selection
" TODO: nmap <leader>ae to align selection by equal signs

map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

imap <C-f> <C-o>l
imap <C-b> <C-o>h

map <Leader>bk :call BKill()<CR>

map <Leader>bn :bn<CR>
map <Leader>bd :bd<CR>

map <Leader>gb :Gblame<CR>
map <Leader>gs :Gstatus<CR>

let g:NERDTreeWinSize=40
let g:ctrlp_cmd = 'CtrlPMRU'

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

filetype on
filetype plugin on
filetype indent on

set laststatus = 2 " always display status line
set statusline += %{fugitive#statusline()}

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

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rtw :call TrimWhiteSpace()<CR>

au BufRead /tmp/mutt-* set tw=72
augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END

let NERDSpaceDelims = 1 " space between comment delimiter and content
let NERDCompactSexyComs = 1
