" Impostazione tabs
set tabstop=4
set shiftwidth=4
set autoindent

" folding
set foldmethod=indent
set foldlevelstart=99
nnoremap <space> za
vnoremap <space> zf

" Roba grafica
syntax on
set relativenumber

" Backup file in /tmp
set nobackup

" Roba da gentoo, credo
set nocompatible
set backspace=indent,eol,start
set history=50
set ruler
let g:tex_flavor='latex'

if filereadable("/etc/vimrc.local")
  source /etc/vimrc.local
endif


