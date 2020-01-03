" Required configuration for vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Specify plugins
Plugin 'gmarik/vundle'
Plugin 'Chiel92/vim-autoformat'

" Additional config for vundle
filetype plugin indent on
set shell=/bin/bash

" Apply formatter on save
au BufWrite * :Autoformat

" Disable fallback to vim's indent file, retabbing and removing trailing whitespace
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Use black formatter
let g:formatters_python=['black']

" Set additional vim options
set encoding=utf-8
set ruler
set number
