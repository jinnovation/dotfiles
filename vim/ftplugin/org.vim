function! InsertLaTeX ()
  normal i #+BEGIN_LaTeX
  normal ==

  normal o

  normal i #+END_LaTeX
  normal ==
  normal k
endfunction

nmap <localleader>l<Tab> :call InsertLaTeX()<CR>
