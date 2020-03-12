" Required configuration for vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Specify plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tmhedberg/SimpylFold'
Plugin 'mileszs/ack.vim'
Plugin 'crusoexia/vim-monokai'

" Additional config for vundle
call vundle#end()
filetype plugin indent on
set shell=/bin/bash

" Color
syntax enable
silent! colorscheme monokai

" Apply formatter on save
au BufWrite * :Autoformat

" Disable fallback to vim's indent file, retabbing and removing trailing whitespace
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Use better code folding
let g:SimpylFold_docstring_preview = 1

" Use black formatter
let g:formatters_python=['black']

" Set additional vim options
set encoding=utf-8
set ruler
set number
set viminfo='20,<1000 " inc copy/paste-buffer
set tags=./.git/tags; " where to find ctags
