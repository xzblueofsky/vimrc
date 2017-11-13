syntax on
set backspace=indent,eol,start
set nocompatible
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set sts=4
set expandtab
set sta
let &termencoding=&encoding
set fileencodings=utf-8,gbk
colorscheme desert

" YouCompleteMe configuration
set completeopt=menu

" c++ config file location
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'terryma/vim-multiple-cursors'

call vundle#end()

filetype plugin indent on

" close the auto indent to support paste
" set noai nosi
