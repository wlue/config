setlocal ts=4 sts=4 sw=4
setlocal textwidth=80
setlocal spell

map <buffer> <Leader>c :!markdown % > %:r.html
map <buffer> <Leader>r :!open -a "Google Chrome" %:r.html
