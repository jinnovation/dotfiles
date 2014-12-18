" Kill the current buffer
" Behaves very similarly to emacs' C-x k
function! BKill()
  let bnum = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
  if bnum==1
    bd
  else
    bp
    bd #
  endif
endfunction

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
