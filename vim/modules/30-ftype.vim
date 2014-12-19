augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*     setfiletype mail

  " gitconfig
  autocmd BufRead,BufNewFile */gitconfig setfiletype gitconfig
augroup END
