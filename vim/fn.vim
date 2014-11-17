function! BKill()
  let bnum = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
  if bnum==1
    bd
  else
    bp
    bd #
  endif
endfunction

