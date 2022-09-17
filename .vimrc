call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" basic vim configurations
syntax on
filetype indent plugin on
set nocompatible
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set noesckeys
set number
set relativenumber
set ignorecase
set smartcase
set incsearch
set hlsearch
set autochdir
set nowrap
set backspace=indent,eol,start
colorscheme desert
