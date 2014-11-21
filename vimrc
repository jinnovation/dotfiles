if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif

if filereadable(expand("~/.vim/fn.vim"))
  source ~/.vim/fn.vim
endif

let mapleader = ","
let maplocalleader = "\\"

set scrolloff=3

" search
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase

" interface
set splitbelow
set splitright
set colorcolumn=80
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

map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

imap <C-f> <C-o>l
imap <C-b> <C-o>h

map <Leader>bk :call BKill()<CR>

map <Leader>bn :bn<CR>
map <Leader>bd :bd<CR>

let g:NERDTreeWinSize=40
let g:ctrlp_cmd = 'CtrlPMRU'

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

filetype plugin indent on

set statusline+=%{fugitive#statusline()}

