
set nocompatible

filetype on
filetype plugin on

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on
colorscheme wombat

if has('gui_running')

	set gfn=Inconsolata:h15

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

" By default, use real tabs
set tabstop=4
set shiftwidth=4
set ch=2

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

set vb
set noswapfile
"set nobackup
"set backupdir=~/.vimtmp

" Better window splitting start locations
set splitright
set splitbelow

" Show auto-completion in command line
set wildmenu

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
nmap <Leader>m :make<CR>

" Rake 
nmap <Leader>M :!rake<CR>

" OmniCompletion
set completeopt=menuone,preview
set ofu=syntaxcomplete#Complete

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Plugin Related Mappings:

" FuzzyFinder
nmap <Leader>ff :FufFile<CR>
nmap <Leader>fd :FufDir<CR>
nmap <Leader>fb :FufBuffer<CR>
nmap <Leader>ft :FufTag<CR>

" Toggle NERDTree
nmap <Leader>n :NERDTreeToggle<CR>
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
					 \ exe "normal g'\"" | endif
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" Toggle taglist
nmap <Leader>t :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=40
let Tlist_Inc_Winwidth=0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File=1

" Show functions, methods, classes, and global variables in JavaScript
let tlist_javascript_settings = 'javascript;f:function;m:method;c:constructor;v:variable'

" SuperTab
" let g:SuperTabDefaultCompletionType = '<c-n>'

" SuperTab -- set default tab completion key to be <leader><space>
" and allow the ability to toggle between that sequence and simply
" using the <tab> key:
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let SuperTabMappingForward = '<S-Space>'


" snipMate

" do our own mappings
" let s:did_snips_mappings = 0
 
" ino <silent> <Leader>sr <c-r>=TriggerSnippet()<cr>
" snor <silent> <Leader>sr <esc>i<right><c-r>=TriggerSnippet()<cr>
" ino <silent> <Leader>ss <c-r>=ShowAvailableSnips()<cr>


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
endfunction

au FileType html call ConfigHTML()

" JavaScript files
function! ConfigJavaScript()
	map <buffer> ,c :w<CR>:!clear;jsl -process "%"
endfunction

au FileType javascript call ConigJavaScript()

" Objective-C files
let g:objc_man_key="M"

" set the mapleader back to \ so that plugin mappings do not 
" interfere with my map leader (,)
let mapleader="\\"

