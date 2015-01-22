call plug#begin("~/.vim/plugged")

Plug 'whatyouhide/vim-gotham'          " colorscheme

Plug 'scrooloose/nerdcommenter'        " commenting keybinds and functionality
Plug 'tpope/vim-fugitive'              " Git wrapper
Plug 'tpope/vim-surround'              " surround with brackets, parens, etc
Plug 'tpope/vim-endwise'               " add 'end' to Ruby blocks etc
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'                  " fuzzy file navigation/location
Plug 'godlygeek/tabular'               " aligning
Plug 'wakatime/vim-wakatime'
Plug 'Lokaltog/vim-easymotion'
Plug 'embear/vim-localvimrc'           " project-specific vimrc files
Plug 'mileszs/ack.vim'
Plug 'glts/vim-cottidie'               " brings Vim tips to messages area
Plug 'kien/rainbow_parentheses.vim'    " matches matching parens by color
Plug 'zaiste/tmux.vim'                 " tmux syntax highlighting
call plug#end()
