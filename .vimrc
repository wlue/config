set nocompatible
syntax on


filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" Bundles (plugins)
Bundle 'Lokaltog/vim-powerline'
Bundle 'groenewege/vim-less'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'matthias-guenther/hammer.vim'
Bundle 'mileszs/ack.vim'
Bundle 'nono/vim-handlebars'
Bundle 'rphillips/vim-zoomwin'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'skammer/vim-css-color'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/matchit.zip'
Bundle 'wavded/vim-stylus'
Bundle 'scrooloose/syntastic'
Bundle 'davidhalter/jedi-vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'tpope/vim-liquid'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'SyntaxComplete'
Bundle 'wlue/vim-dm-syntax'

filetype plugin indent on

if has('gui_running')
  colorscheme wombat256mod
  set gfn=Inconsolata-dz\ for\ Powerline:h12,Inconsolata:h14,Consolas:h11

  " get rid of the toolbar/scrollbars
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
else
  colorscheme wombat256mod
endif

let g:Powerline_symbols = 'fancy'

set mouse=a
set number
set backspace=2
set title
set titleold=
set hidden
set autoindent
set ruler
set history=1000
set autoread
set ch=3

" By default, use spaces for tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" 80 character limit
set textwidth=80

" Mark the 81st column
" if exists('+colorcolumn')
"   set colorcolumn=+1
" endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set shortmess=atI

" Show trailing spaces
set list listchars=tab:\ \ ,trail:·

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

" highlight searches, and search while typing
set hlsearch
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use , as a map leader
let mapleader=","

" remote highlighting when pressing Escape
nnoremap <silent> <ESC> :noh<cr><ESC>

" Map Semicolon to : for faster command execution
nmap ; :

" Make J/K behave like { (move through paragraphs).  Same with ] and }
noremap J }
noremap K {

" let [jk] go down and up by display lines instead of real lines. Let g[jk]
" do what [jk] normally does
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" + and _ switch between split screens
nmap + <C-w>w
nmap _ <C-w>W

"<Tab> and <S-Tab> switch between split screens
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w>W

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
nmap <Leader>m :make<CR>
nmap <Leader>r :make run<CR>

" Rake
nmap <Leader>M rake<CR>

" OmniCompletion
set completeopt=longest,menuone,preview

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

" Plugin Related Mappings:

" Cocoa.vim
let g:objc_man_key="M"

" Powerline
set laststatus=2

" CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 1

nnoremap <Leader>b :CtrlPBuffer<CR>
set wildignore+=*.o,.git,*.jpg,*.png,*.swp,*.d,*.gif,*.pyc,node_modules,*.class,*.crf,*.hg,*.orig,.meteor,*.acn,*.acr,*.alg,*.aux,*.bbl,*.blg,*.dvi,*.fdb_latexmk,*.glg,*.glo,*.gls,*.idx,*.ilg,*.ind,*.ist,*.lof,*.log,*.lot,*.maf,*.mtc,*.mtc0,*.nav,*.nlo,*.out,*.pdfsync,*.ps,*.snm,*.synctex.gz,*.toc,*.vrb,*.xdy,*.pdf,*.bcf,*.run.xml

" Toggle NERDTree
let NERDTreeIgnore=['\.o$', '\.d$', '\~$', '\.class$', '\.pyc']
nmap <Leader>n :NERDTreeToggle<CR>
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g'\"" | endif
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
      \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
      \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Toggle Tagbar
nmap <Leader>T :TagbarToggle<CR>

" Show functions, methods, classes, and global variables in JavaScript
let tlist_javascript_settings = 'javascript;f:function;m:method;c:constructor;v:variable'

" SuperTab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Gundo

nmap <Leader>G :GundoToggle<CR>
let g:gundo_right = 1

" jedi
let g:jedi#pydoc = "<Leader>d"
let g:jedi#related_names_command = "<Leader>N"

" zoomwin

nnoremap <Leader>z :ZoomWin<CR>

" Easy Tags

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
  map <buffer> <Leader>c :w<CR>:so %<CR>
  map <buffer> <Leader>r :w<CR>:so %<CR>
endfunction

au FileType vim   call ConfigVimRC()

" DM/DME files
function! ConfigDM()
  map <buffer> <Leader>c :w<CR>:!DreamMaker %<CR>
endfunction

au FileType dm call ConfigDM()

function! ConfigDME()
  set filetype=dm
  map <buffer> <Leader>c :w<CR>:!DreamMaker %<CR>

  " Run in DreamDaemon command line
  map <buffer> <Leader>r :!clear;DreamDaemon <C-R>=CurrFileNoExt()<CR>.dmb<CR>

  " Run in DreamSeeker
  map <buffer> <Leader>R :!clear;open <C-R>=CurrFileNoExt()<CR>.dmb<CR>
endfunction

au FileType dme call ConfigDME()

