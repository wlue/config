
filetype on
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible
syntax on
filetype plugin on

" for .dm and .dme files, load the dm syntax file
au BufNewFile,BufRead *.dme set filetype=dm
au BufNewFile,BufRead *.dm set filetype=dm

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
set splitbelow

" set wildmode

set hlsearch
nnoremap <silent> <ESC> :noh<cr><ESC>

" trl-s for smart saving. (Don't write to file if no changes)
nnoremap <silent><C-s> :update<Cr>
inoremap <silent><C-s> <Esc>:update<Cr>

" Map Semicolon to : for faster command execution
nmap ; :

" Make [ behave like { (move through paragraphs).  Same with ] and }
noremap [ {
noremap ] }

" + and _ switch between split screens
nmap + <C-w>w
nmap _ <C-w>W

" { and } switch between split screens
nmap { :tabp<CR>
nmap } :tabn<CR>

let mapleader=","

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)

map <Leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Shortcuts for changing viewport dimensions
map <Leader>q <C-w>6<
map <Leader>w <C-w>6>

" Toggle NERDTree
nmap <Leader>n :NERDTreeToggle<CR>
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                     \ exe "normal g'\"" | endif  

" Toggle taglist
nmap <Leader>t :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=40

" Make
nmap <Leader>m :make<CR>

