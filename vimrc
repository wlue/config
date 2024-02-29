" vimrc configuration file
" Author: Wen-Hao Lue <me@wenhaolue.com>

" Use Vundle for plugin management.
set nocompatible
syntax on
filetype off

" Vundle:
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

" Plugins:
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'matthias-guenther/hammer.vim'
Plugin 'mileszs/ack.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/cocoa.vim'
Plugin 'rphillips/vim-zoomwin'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'Rip-Rip/clang_complete'
Plugin 'benmills/vimux'

" Syntax plugins
Plugin 'SyntaxComplete'
Plugin 'scrooloose/syntastic'
Plugin 'groenewege/vim-less'
Plugin 'skammer/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-liquid'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'wlue/vim-dm-syntax'
Plugin 'wlue/vim-objc-strings-syntax'
Plugin 'wlue/go.vim'
Plugin 'nono/vim-handlebars'
Plugin 'othree/html5.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'juvenn/mustache.vim'
Plugin 'wlue/thrift.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'guns/vim-clojure-static'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'hdima/python-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'toyamarinyon/vim-swift'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'chase/vim-ansible-yaml'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Settings:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists('g:shadowvim')
  colorscheme wombat256mod
end

if exists('g:shadowvim')
  map <C-o> <Cmd>SVPress <LT>C-D-Left><CR>
  map <C-i> <Cmd>SVPress <LT>C-D-Right><CR>
end

if has('gui_running')
  set gfn=Inconsolata-dz\ for\ Powerline:h12,Inconsolata:h14,Consolas:h11

  " Get rid of the toolbar/scrollbars.
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set guioptions+=k
endif

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
set laststatus=2
set nofoldenable

" By default, use spaces for tabs, and 4 spaces.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" 80 character limit default.
set textwidth=80

" Copy/paste from terminal vim
set clipboard=unnamed

" Mark the 81st column.
if exists('+colorcolumn')
  set colorcolumn=+1
  highlight ColorColumn ctermbg=235 guibg=#222222
endif

" Highlight VCS conflict markers.
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" set shortmess=a
set cmdheight=2

" Show trailing spaces.
set list
set listchars=tab:\ \ ,trail:·

" Only case sensitive if a capital letter exists in a search query.
set ignorecase
set smartcase

" Keep cursor 5 lines in the screen.
set scrolloff=5

" No visual bell.
set vb t_vb=
set noswapfile
set nobackup

" Better window splitting start locations.
set splitright
set splitbelow

" Show auto-completion in command line.
set wildmenu

" Automatically load file changes.
set autoread

" Highlight searches, and search while typing.
set hlsearch
set incsearch

" Remove highlighting when pressing ESC.
nnoremap <silent> <ESC> :noh<cr><ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use , as a map leader.
let mapleader=","

" Map semicolon to : for faster command execution.
nmap ; :

" Make J/K move between paragraphs.
noremap J }
noremap K {

" Let [jk] go down and up by display lines instead of real lines. Let g[jk]
" do what [jk] normally does.
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

"<Tab> and <S-Tab> switch between split screens
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w>W
" nmap + <C-w>w
" nmap _ <C-w>W

" To make Shift-Tab work in terminal vim
map <Esc>[Z <s-tab>
ounmap <Esc>[Z

" Ctrl-P brings back to previous file in buffer.
nmap <C-p> <C-^>
imap <C-p> <C-^>

" ,v brings up .vimrc
" ,V reloads vimrc -- making all changes active (have to save first)
map <Leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:echo 'reloaded'<CR>

" Toggle line numbers.
map <Leader>l :set number!<CR>

" Shortcuts for changing viewport dimensions.
map <Leader>q <C-w>6<
map <Leader>w <C-w>6>

" Make
nmap <Leader>m :make<CR>

" Rake
nmap <Leader>M :!rake<CR>

" Syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_checker_args='--ignore=E501,E225'

let g:syntastic_javascript_checkers = ['eslint']

" OmniCompletion
set completeopt=longest,menuone,preview

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

set rtp+=/usr/local/opt/fzf


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Mappings:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cocoa.vim
let g:objc_man_key="M"

" Powerline
let g:Powerline_symbols = 'fancy'

" Airline
let g:airline_powerline_fonts=1

" fzf
nnoremap <silent> <leader>t :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" CtrlP
" let g:ctrlp_map = '<Leader>t'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_clear_cache_on_exit = 1

" nnoremap <Leader>b :CtrlPBuffer<CR>
set wildignore+=*.o,.git,*.jpg,*.png,*.swp,*.d,*.gif,*.pyc,node_modules,*.class,*.crf,*.hg,*.orig,.meteor,*.acn,*.acr,*.alg,*.aux,*.bbl,*.blg,*.dvi,*.fdb_latexmk,*.glg,*.glo,*.gls,*.idx,*.ilg,*.ind,*.ist,*.lof,*.log,*.lot,*.maf,*.mtc,*.mtc0,*.nav,*.nlo,*.out,*.pdfsync,*.ps,*.snm,*.synctex.gz,*.toc,*.vrb,*.xdy,*.pdf,*.bcf,*.run.xml

" Toggle NERDTree
let NERDTreeIgnore=['\.o$', '\.d$', '\~$', '\.class$', '\.pyc', '.DS_Store', 'node_modules/']
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
let g:jedi#documentation_command = "<Leader>d"
let g:jedi#usages_command = "<Leader>N"

" zoomwin
nnoremap <Leader>z :ZoomWin<CR>

" Tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" vim-javascript
let javascript_enable_domhtmlcss = 1
let b:javascript_fold = 0
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns the current file without its extension
function! CurrFileNoExt()
  return substitute(@%, '\.[^\.]*$','','')
endfunction

