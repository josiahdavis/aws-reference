" Configure vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Specify plugins
Plugin 'gmarik/vundle'
Plugin 'Chiel92/vim-autoformat'
filetype plugin indent on

" Apply black formatter on save
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatters_python=['black']

" Basic vim options
set encoding=utf-8
set ruler
set number
