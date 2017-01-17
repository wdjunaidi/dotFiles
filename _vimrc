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
call plug#begin('~/.vim/bundle')

" Feature plugins
Plug 'junegunn/vim-plug'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'majutsushi/tagbar'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'fholgado/minibufexpl.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'neomake/neomake'

" Language plugins
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'mklabs/grunt', { 'for': 'javascript' }
Plug 'Valloric/YouCompleteMe', { 'for': 'javascript', 'do': './install.py --clang-completer' }
Plug 'tfnico/vim-gradle', { 'for': ['groovy', 'gradle'] }
Plug 'c-brenn/phoenix.vim'
Plug 'slashmili/alchemist.vim'
let g:alchemist_tag_disable=1

call plug#end()

if $COLORTERM=='gnome-terminal' && !has('nvim')
  set term=xterm-256color
endif
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
autocmd! BufWritePost * Neomake

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
