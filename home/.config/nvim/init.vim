set encoding=utf-8

if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
  else
    set clipboard=unnamed
  endif
endif

set background=dark

set number
set showmatch

" Case insensitive search unless it contains a capital letter
set ignorecase
set smartcase

set expandtab
set autoindent
set softtabstop=2
set shiftwidth=2
set tabstop=2

set undodir=~/.vimundo
set undofile

call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'lilydjwg/colorizer'
call plug#end()

colorscheme nord

