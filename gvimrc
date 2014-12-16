set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set guioptions-=L  " left scrollbar
set guioptions-=b  " bottom scrollbar
set guioptions+=c  " console-like dialogs

colorscheme gotham256
set statusline += %{fugitive#statusline()}
