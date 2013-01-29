" invoke pathogen (vim package manager)
call pathogen#infect()

" General settings
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8
set hidden            " hide open buffers instead of closing them, when opening a new one with :e
set laststatus=2      " Always show the statusline
set ttyfast           " Makes vim behave faster in certain terminals
set scrolloff=3       " Show 3 extra lines when scrolling up/down
set cursorline                           " Highlight the line where the cursor is
syntax enable         " Turn on syntax highlighting allowing local overrides

" Folding settings
set foldmethod=syntax " Use syntax-provided folding when available
set foldlevel=99      " Folds are open by default

" Whitespace settings
set nowrap                          " don't wrap lines
set tabstop=2                       " a tab is two spaces
set shiftwidth=2                    " an autoindent (with <<) is two spaces
set expandtab                       " use spaces, not tabs
set backspace=indent,eol,start      " backspace through everything in insert mode

set list                            " Show invisible characters using listchars
set listchars=""                      " Reset the listchars
set listchars=tab:›\                  " show tabs as lsaquos
set listchars+=trail:·                " show trailing spaces as dots
set listchars+=extends:>              " The character to show in the last column when the line continues right
set listchars+=precedes:<             " The character to show in the last column when the line continues left

filetype plugin indent on           " allow for individual indentations per file type

" Search settings
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
set gdefault    " by default, replace globally (you can ommit /g at the end of a search-and-replace

" Ignore these files when auto-completing with tab (for example when opening with :e)
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem          " general programming stuff
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz                      " compressed files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/* " vendor and sass-generated stuff
set wildignore+=*/node_modules/*
set wildignore+=*.swp,*~,._*                                                 " backup and temp files

" Backup, swap and undo settings
set undofile                     " Save undo's after file closes
set undolevels=1000              " How many undos
set undoreload=10000             " number of lines to save for undo
set undodir=~/.vim/_undo         " where to save undo histories
set backupdir=~/.vim/_backup/    " where to put backup files.
set directory=~/.vim/_swap/      " where to put swap files.

" Deactivate the PRESS ENTER OR TYPE COMMAND TO CONTINUE message
set shortmess=atI

" Colorscheme settings
let g:solarized_termcolors=256
let g:solarized_visibility="low"
set t_Co=16
set background=dark
colorscheme solarized

" Autocommands
if has("autocmd")

  " When entering a window, activate cursorline
  autocmd WinEnter * setlocal cursorline

  " When leaving a window, deactivate cursorline
  autocmd WinLeave * setlocal nocursorline

  " before writing a buffer, remove trailing spaces (respecting cursor position) when saving files
  autocmd BufWritePre * kz|:%s/\s\+$//e|'z

  " before writing a buffer, if the current directory does not exist, create it
  autocmd BufWritePre * :silent !mkdir -p %:p:h

  " After opening, jump to last known cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Golang:
  " Use tabs, and make them 4-spaces long
  autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  " reformat the file before each save
  autocmd FileType go autocmd BufWritePre <buffer> Fmt
endif

" key settings

let mapleader=","              " set the <leader> key to comma

" I want to learn hjkl without going bonkers. Let me have a message instead of NOP
noremap <up>    :echoerr 'USE K TO GO UP'<CR>
noremap <down>  :echoerr 'USE J TO GO DOWN'<CR>
noremap <left>  :echoerr 'USE H TO GO LEFT'<CR>
noremap <right> :echoerr 'USE L TO GO RIGHT'<CR>
inoremap <up>    <ESC>:echoerr 'USE K TO GO UP'<CR>
inoremap <down>  <ESC>:echoerr 'USE J TO GO DOWN'<CR>
inoremap <right> <ESC>:echoerr 'USE L TO GO RIGHT'<CR>
inoremap <left>  <ESC>:echoerr 'USE H TO GO LEFT'<CR>

" Map ESC to jk
imap jk <ESC>
imap Jk <ESC>
imap JK <ESC>

" Use jk for moving up/down in autocomplete (supertab)
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap J gj
nnoremap k gk
nnoremap K gk

" Do not exit visual mode when shifting
vnoremap < <gv
vnoremap > >gv

" comma q quits and saves, comma w saves without warnings
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>

" shift key fixes
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe

" Split buffer vertically or horizontally: leader v, leader h
nn <leader>v <C-w>v<C-w>l
nn <leader>h <C-w>s<C-w>j

" Move between splits with leader-direction instead of c-w direction
nn <C-h> <C-w>h
nn <C-j> <C-w>j
nn <C-k> <C-w>k
nn <C-l> <C-w>l
nn <C-H> <C-w>h
nn <C-J> <C-w>j
nn <C-K> <C-w>k
nn <C-L> <C-w>l

" Tab switches open buffers
nmap <tab> <C-w><C-w>

" Align commas, equal signs, colons and pipes with leader = <separator>
nmap <Leader>== :Tabularize / =<CR>
vmap <Leader>== :Tabularize / =<CR>
nmap <Leader>=> :Tabularize / =><CR>
vmap <Leader>=> :Tabularize / =><CR>
nmap <Leader>=: :Tabularize / :\zs<CR>
vmap <Leader>=: :Tabularize / :\zs<CR>
nmap <Leader>=; :Tabularize / ;\zs<CR>
vmap <Leader>=; :Tabularize / ;\zs<CR>

" remap space bar to search
:nmap <Space> /







