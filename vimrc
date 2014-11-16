if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif

let mapleader = ","
let maplocalleader = "\\"

set number
set incsearch
set hlsearch

set splitbelow
set splitright
set expandtab
set autoindent
set smartindent
set cindent
set shiftwidth=2

set colorcolumn=80

set cursorline

set shortmess+=I

set autochdir

set visualbell

syntax on
nmap <S-Enter> O<esc>j
nmap <CR> o<Esc>k
nmap <C-Tab> <C-w><C-w>
nmap <C-S-Tab> <C-w>W

map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

function! BKill()
  let bnum = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
  if bnum==1
    bd
  else
    bp
    bd #
  endif
endfunction
map <Leader>bk :call BKill()<CR>

map <Leader>bn :bn<CR>

let g:NERDTreeWinSize=40
let g:ctrlp_cmd = 'CtrlPMRU'

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

filetype plugin on

set statusline+=%{fugitive#statusline()}
