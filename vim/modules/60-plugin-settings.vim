let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline#extensions#tabline#buffer_idx_mode = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let delimitMate_expand_cr = 1
" {<cursor>}
" when <cr>, turns into
" {
"   <cursor>
" }
