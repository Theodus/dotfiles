set encoding=utf-8
set visualbell " Blink cursor on error instead of beeping
set nocompatible
set mouse=a " enable mouse in all modes

set nobackup

set background=dark
colorscheme peachpuff

set nofoldenable " disable code folding
set foldmethod=indent " fold based on indent level

set laststatus=2 " Status bar

syntax enable " enable syntax processing

set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " indent is a single tab
set expandtab " tabs are spaces
set smarttab
set smartindent

set number " show line numbers

set showcmd " show command in bottom bar

"filetype indent on " load filetype-specific indent files

set wildmenu " visual autocomplete for command menu

set lazyredraw " redraw only when we need to

set showmatch " highlight matching [{()}]

set incsearch " search as characters are entered

set hlsearch " highlight matches

" move vertically by visual line
nnoremap j gj
nnoremap k gk

let mapleader="," " leader is comma

set ruler " Show file stats

