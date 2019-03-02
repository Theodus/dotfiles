set encoding=utf-8

if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
  else
    set clipboard=unnamed
  endif
endif

set background=dark

set expandtab
set autoindent
set softtabstop=2
set shiftwidth=2
set tabstop=2

call plug#begin()

Plug 'arcticicestudio/nord-vim'

call plug#end()

colorscheme nord

