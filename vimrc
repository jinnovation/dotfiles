if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

if filereadable(expand("~/.vim/fn.vim"))
  source ~/.vim/fn.vim
endif

if filereadable(expand("~/.vim/ftype.vim"))
  source ~/.vim/ftype.vim
endif

let mapleader = ","
let maplocalleader = "\\"

if filereadable(expand("~/.vim/key.vim"))
  source ~/.vim/key.vim
endif

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
set textwidth=80

" editing
set expandtab
set autoindent
set smartindent
set cindent
set shiftwidth=2

set cursorline

set shortmess+=I " don't display intro message on Vim start

set autochdir

set visualbell

set autoindent
set laststatus=2 " always display status line

syntax on " enable syntax highlighting

let g:NERDTreeWinSize=40
let g:ctrlp_cmd = 'CtrlPMRU'

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

filetype on
filetype plugin on
filetype indent on

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

let NERDSpaceDelims=1 " space between comment delimiter and content
let NERDCompactSexyComs=1

colorscheme gotham
if filereadable(expand("~/.vim/color.vim"))
  source ~/.vim/color.vim
endif
