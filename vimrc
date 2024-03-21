" vimrc configuration file
" Author: Wen-Hao Lue <me@wenhaolue.com>

set nocompatible
syntax on
filetype off

" vim-plug
call plug#begin()

" Plugins
Plug 'Lokaltog/vim-powerline'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/matchit.zip'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/ZoomWin'
Plug 'Rip-Rip/clang_complete'
Plug 'benmills/vimux'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'

if has('nvim')
  Plug 'nanozuki/tabby.nvim'
  Plug 'rebelot/kanagawa.nvim'
  Plug 'zbirenbaum/copilot.lua'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }
end

" Syntax plugins
Plug 'wlue/vim-dm-syntax'
Plug 'wlue/vim-objc-strings-syntax'
Plug 'wlue/go.vim'
Plug 'wlue/thrift.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'hdima/python-syntax'
Plug 'chase/vim-ansible-yaml'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'stephenway/postcss.vim'

call plug#end()

if has('nvim')
  lua require("CopilotChat").setup { debug = true }
end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Settings:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists('g:shadowvim')
  if has('nvim')
    colorscheme kanagawa
  else
    colorscheme wombat256mod
  end
end

if exists('g:neovide')
  " Support native Mac OS key bindings in Neovide
  let neovide_cursor_animation_length = 0
  let neovide_scroll_animation_length = 0
  let g:neovide_input_use_logo = 1
  map <D-v> "+p<CR>
  map! <D-v> <C-R>+
  tmap <D-v> <C-R>+
  vmap <D-c> "+y<CR>

  nnoremap <D-}> :tabnext<CR>
  nnoremap <D-{> :tabprevious<CR>
  nnoremap <D-t> :tabnew<CR>
  nnoremap <D-s> :w<CR>
  nnoremap <D-w> :bd<CR>
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

" Allow copy paste in neovim
let g:neovide_input_use_logo = 1
map <D-v> "+p<CR>
map! <D-v> <C-R>+
tmap <D-v> <C-R>+
vmap <D-c> "+y<CR> 

set rtp+=/usr/local/opt/fzf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Mappings:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Coq
let g:coc_node_path = '~/.nvm/versions/node/v21.7.0/bin/node'
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Powerline
let g:Powerline_symbols = 'fancy'

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

" Gundo
nmap <Leader>G :GundoToggle<CR>
let g:gundo_right = 1

" zoomwin
nnoremap <Leader>z :ZoomWin<CR>

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

