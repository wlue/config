
syntax on

filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

colorscheme wombat
set gfn=Inconsolata:h15

set number
set mouse=a

set backspace=2
set tabstop=4
set shiftwidth=4
set ch=2

set autoindent
set ruler
set title

set vb
set noswapfile
set backupdir=~/.vimtmp

let mapleader=","

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)

map <Leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Toggle NERDTree
nmap <Leader>n :NERDTreeToggle<CR>

" Make
lmap <Leader>m :make<CR>



