colorscheme vividchalk

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

" Set buffer to always use tab
set switchbuf=usetab,newtab

if v:version >= 700
  set viminfo=!,'20,<50,s10,h
endif
set virtualedit=block

call pathogen#infect()
syntax on
filetype plugin indent on
