set nocompatible
" Show all available options when navigating
set wildmode=list:longest
set wildmenu

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

set hlsearch
set incsearch
set showmatch

" Show line numbers
set number

" Set visual bell (no audio notifications)
set visualbell

set cmdheight=2
set laststatus=2
set showcmd
"set splitbelow

if v:version >= 700
  set viminfo=!,'20,<50,s10,h
endif
set virtualedit=block

set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/vimproc'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-ragtag'
Plugin 'Shougo/unite.vim'
Plugin 'moll/vim-node'
Plugin 'tpope/vim-fugitive'
Plugin 'tfnico/vim-gradle'
Plugin 'tpope/vim-endwise'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'mklabs/grunt'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline.git'
Plugin 'tpope/vim-commentary'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-ruby/vim-ruby'
Plugin 'JulesWang/css.vim'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

if $COLORTERM=='gnome-terminal'
  set term=xterm-256color
endif
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" MiniBufExplorer {{{
nnoremap <silent> <F9> :MBEToggle<CR>
" }}}

" Tagbar {{{
noremap <silent> <F10> :TagbarToggle<CR>
noremap <silent> <C-F10> :TagbarOpen<CR>
" }}}

" Unite {{{
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <c-f> :Unite -no-split file buffer<CR>
nnoremap <c-b> :Unite -no-split buffer<CR>
" }}}

" Ragtag {{{
let g:ragtag_global_maps = 1
" }}}

" gitgutter {{{
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" }}}

cabbr <expr> %% expand('%:p:h')
nnoremap <silent> <esc> :noh<return><esc>
nnoremap <silent> <C-N> :bn<CR>
nnoremap <silent> <C-P> :bp<CR>

map <silent> <C-k> :E<CR>
let g:netrw_browse_split = 0
let g:netrw_liststyle = 3

if has("autocmd") && exists("+omnifunc")
  autocmd FileType *
      \ if &omnifunc == "" |
      \    setlocal omnifunc=syntaxcomplete#Complete |
      \ endif
endif

inoremap <silent> jk <ESC>