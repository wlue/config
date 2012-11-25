
" Use instead of "vimfiles" on Windows
set runtimepath^=~/.vim  

set nocompatible

filetype off

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype on
filetype plugin on

syntax on
colorscheme wombat

if has('gui_running')

	set gfn=Inconsolata:h15,Consolas:h11

	" get rid of the toolbar
	set guioptions-=T

	" get rid of scrollbars
	set guioptions-=l
	set guioptions-=L
	set guioptions-=r
	set guioptions-=R
	
	set number
	set mouse=a

endif

set backspace=2
  
" By default, use spaces for tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set ch=3

set hidden
set autoindent
set ruler
set title
set history=1000

set shortmess=atI

" Only case sensitive if a capital letter exists in a search query
set ignorecase
set smartcase

" Keep cursor 5 lines in the screen 
set scrolloff=5

" No visual bell
set vb t_vb=
set noswapfile
set nobackup

" Better window splitting start locations
set splitright
set splitbelow

" Show auto-completion in command line
set wildmenu

" Automatically load file changes
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use , as a map leader
let mapleader=","

" highlight searches, and search while typing
set hlsearch
set incsearch

" remote highlighting when pressing Escape
nnoremap <silent> <ESC> :noh<cr><ESC>

" trl-s for smart saving. (Don't write to file if no changes)
nnoremap <silent><C-s> :update<Cr>
inoremap <silent><C-s> <Esc>:update<Cr>

" Map Semicolon to : for faster command execution
nmap ; :

" Make J/K behave like { (move through paragraphs).  Same with ] and }
noremap J }
noremap K {

" + and _ switch between split screens
nmap + <C-w>w
nmap _ <C-w>W

" { and } switch between split screens
nmap { :tabp<CR>
nmap } :tabn<CR>

nmap <C-p> <C-^>
imap <C-p> <C-^>

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)

map <Leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Toggle line numbers (since by default, turned off in non-gui vim
map <Leader>l :set number!<CR>

" Shortcuts for changing viewport dimensions
map <Leader>q <C-w>6<
map <Leader>w <C-w>6>

" Make
nmap <Leader>m :!make<CR>
nmap <Leader>r :!make run<CR>

" Rake 
nmap <Leader>M :!rake<CR>

" OmniCompletion
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete
set omnifunc=phpcomplete#CompletePHP

" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Plugin Related Mappings:

" FuzzyFinder
nmap <Leader>ff :FufFile<CR>
nmap <Leader>fd :FufDir<CR>
nmap <Leader>fb :FufBuffer<CR>
nmap <Leader>ft :FufTag<CR>

" Toggle NERDTree
"
let NERDTreeIgnore=['\.o$', '\.d$', '\~$', '\.class$', '\.pyc']

nmap <Leader>n :NERDTreeToggle<CR>
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
					 \ exe "normal g'\"" | endif
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Toggle Tagbar
nmap <Leader>t :TagbarToggle<CR>

" Show functions, methods, classes, and global variables in JavaScript
let tlist_javascript_settings = 'javascript;f:function;m:method;c:constructor;v:variable'

" SuperTab
" let g:SuperTabDefaultCompletionType = '<c-n>'

" SuperTab -- set default tab completion key to be <leader><space>
" and allow the ability to toggle between that sequence and simply
" using the <tab> key:
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" let SuperTabMappingForward = '<M-Space>'

" Gundo

nmap ,g :GundoToggle<CR>
let g:gundo_right = 1

" Easy Tags

let g:easytags_cmd = '/usr/local/bin/ctags'
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" Returns the current file without its extension
function! CurrFileNoExt()
	return substitute(@%, '\.[^\.]*$','','')
endfunction

" Language Specific Scripts:
" ,c - compile
" ,r - run

" .vimrc file
function! ConfigVimRC()
	map <buffer> ,c :w<CR>:so %<CR>
	map <buffer> ,r :w<CR>:so %<CR>
endfunction

au FileType vim   call ConfigVimRC()

" DM/DME files
function! ConfigDM()
	map <buffer> ,c :w<CR>:!DreamMaker %<CR>
endfunction

au BufRead,BufNewFile *.dm setfiletype dm
au FileType dm call ConfigDM()

function! ConfigDME()
	set filetype=dm
	map <buffer> ,c :w<CR>:!DreamMaker %<CR>

	" Run in DreamDaemon command line
	map <buffer> ,r :!clear;DreamDaemon <C-R>=CurrFileNoExt()<CR>.dmb<CR>

	" Run in DreamSeeker
	map <buffer> ,R :!clear;open <C-R>=CurrFileNoExt()<CR>.dmb<CR>
endfunction

au BufRead,BufNewFile *.dme setfiletype dme
au FileType dme call ConfigDME()

" HTML files
function! ConfigHTML()
	map <buffer> ,r :w<CR>:!open %<CR>
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
endfunction

au BufRead,BufNewFile *.scss setfiletype scss

au FileType html call ConfigHTML()
au FileType css call ConfigHTML()
au FileType scss call ConfigHTML()

" TEX files

au FileType tex call ConfigTEX()

function! ConfigTEX()
    set textwidth=80

    " Mark the 81st column
    if exists('+colorcolumn')
        set colorcolumn=+1
    endif
endfunction

" JavaScript files
function! ConfigJavaScript()
	map <buffer> ,c :w<CR>:!clear;jsl -process "%"<CR>
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
endfunction

au FileType javascript call ConfigJavaScript()

" PHP files
function! ConfigPHP()
	map <buffer> ,c :w<CR>:!clear;php -l %<CR>
endfunction

au FileType php call ConfigPHP()

" Objective-C files
let g:objc_man_key="M"

" set the mapleader back to \ so that plugin mappings do not 
" interfere with my map leader (,)
let mapleader="\\"

