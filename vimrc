" change the mapleader from \ to ,
let mapleader=","

" invoke pathogen (vim package manager)
call pathogen#infect()

" turn on syntax highlighting
syntax on

" allow for individual indentations per file type
filetype plugin indent on



" removes trailing spaces when saving files
autocmd BufWritePre * :%s/\s\+$//e









