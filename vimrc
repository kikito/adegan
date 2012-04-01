" change the mapleader from \ to ,
let mapleader=","

" invoke pathogen (vim package manager)
call pathogen#infect()

" turn on syntax highlighting
syntax enable

" allow for individual indentations per file type
filetype plugin indent on

" removes trailing spaces when saving files
autocmd BufWritePre * :%s/\s\+$//e

" show line numbers
set number

" use solarized-dark as the main color theme.
" background could also be light
" solarized needs to force terminal colors to 256
" switch background from light to dark by pressing F9
let g:solarized_termcolors=256
set t_Co=16
set background=dark
colorscheme solarized








