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
nnoremap <S-Enter> O<esc>j
nnoremap <CR> o<Esc>k

" FIXME: doesn't cooperate with tmux
nnoremap <C-Tab> <C-w><C-w>
nnoremap <C-S-Tab> <C-w>W

" TODO: nnoremap <leader>ar to align selection
" TODO: nnoremap <leader>ae to align selection by equal signs

noremap <C-n> :NERDTreeToggle<CR>
noremap <F8> :TagbarToggle<CR>

inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h

noremap <Leader>bk :call BKill()<CR>

noremap <Leader>bn :bn<CR>
noremap <Leader>bd :bd<CR>

noremap <Leader>gb :Gblame<CR>
noremap <Leader>gs :Gstatus<CR>

let g:NERDTreeWinSize=40
let g:ctrlp_cmd = 'CtrlPMRU'

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

filetype on
filetype plugin on
filetype indent on

noremap  / <Plug>(easymotion-sn)
onoremap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
noremap n <Plug>(easymotion-next)
noremap N <Plug>(easymotion-prev)

noremap <Leader>l <Plug>(easymotion-lineforward)
noremap <Leader>j <Plug>(easymotion-j)
noremap <Leader>k <Plug>(easymotion-k)
noremap <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

nnoremap <silent> <Leader>rtw :call TrimWhiteSpace()<CR>

let NERDSpaceDelims=1 " space between comment delimiter and content
let NERDCompactSexyComs=1

colorscheme gotham
hi Normal ctermfg=252 ctermbg=none
