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

" Feature plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/vimproc'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'
Plugin 'Shougo/unite.vim'
Plugin 'moll/vim-node'
Plugin 'tpope/vim-fugitive'
Plugin 'tfnico/vim-gradle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'mklabs/grunt'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline.git'
Plugin 'tpope/vim-commentary'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-endwise'

" Language plugins
Plugin 'sheerun/vim-polyglot'

call vundle#end()
filetype plugin indent on

if $COLORTERM=='gnome-terminal' && !has('nvim')
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
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_data_directory='~/.vim/cache/unite'
let dot = '\%(^\|/\)\.'
let dirs = '\%(^\|/\)\%(' . join(
      \ ['node_modules', 'bower_components', 'dist'], '\|')
      \ . '\)\%($\|/\)'
let files = join(['\.beam\%($\)'], '\|')
let pattern = join([dot, dirs, files], '\|')
call unite#custom#source('file,file_rec,file_rec/async,file_rec/neovim,', 'ignore_pattern', pattern)
nnoremap <Leader>f :UniteWithCurrentDir -no-split -start-insert file buffer<CR>
nnoremap <Leader>fr :UniteWithCurrentDir -no-split -start-insert file_rec/async:!<CR>
nnoremap <Leader>b :Unite -no-split buffer<CR>
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
