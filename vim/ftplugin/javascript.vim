setlocal sts=2 sw=2 ts=2 expandtab
set textwidth=100

map <buffer> <Leader>c :!jslint "%"
map <buffer> <Leader>a :e<C-R>=fnamemodify(expand('%'),':p:r')<CR>.coffee<CR>
