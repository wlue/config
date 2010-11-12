
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible
syntax on
filetype plugin on

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

set scrolloff=5

set vb
set noswapfile
set backupdir=~/.vimtmp

" Better window splitting start locations
set splitright
"set splitright
set splitbelow

"set wildmode

set hlsearch
nnoremap <silent> <ESC> :noh<cr><ESC>

" trl-s for smart saving. (Don't write to file if no changes)
nnoremap <silent><C-s> :update<Cr>
inoremap <silent><C-s> <Esc>:update<Cr>

" Make [ behave like { (move through paragraphs).  Same with ] and }
noremap [ {
noremap ] }

"+ and _ switch between split screens
nmap + <C-w>w
nmap _ <C-w>W

"{ and } switch between split screens
nmap { :tabn<CR>
nmap } :tabp<CR>

let mapleader=","

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)

map <Leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Toggle NERDTree
nmap <Leader>n :NERDTreeToggle<CR>

" Make
nmap <Leader>m :make<CR>

