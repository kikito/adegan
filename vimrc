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
syntax enable         " Turn on syntax highlighting allowing local overrides

set cursorline        " Highlight the line where the cursor is
autocmd WinEnter * setlocal cursorline       " Highlight current line when a window gets focused
autocmd WinLeave * setlocal nocursorline     " Remove highlight when the window loses its focus


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

autocmd BufWritePre * :%s/\s\+$//e  " remove trailing spaces from files on save
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
set wildignore+=*.swp,*~,._*                                                 " backup and temp files

" Backup, swap and undo settings
set undofile                     " Save undo's after file closes
set undolevels=1000              " How many undos
set undoreload=10000             " number of lines to save for undo
set undodir=~/.vim/_undo         " where to save undo histories
set backupdir=~/.vim/_backup/    " where to put backup files.
set directory=~/.vim/_swap/      " where to put swap files.

" colorscheme settings
let g:solarized_termcolors=256
set t_Co=16
set background=dark
colorscheme solarized

" key settings
let mapleader=","              " set the <leader> key to ,

set pastetoggle=<F2>           " f2 toggles the 'paste' mode; it allows you to paste text without trying to 'auto-indent' it
nnoremap <F3> :GundoToggle<CR> " f3 toggles 'gundo' - the awesome gundo plugin

" Map ESC to jk
imap jk <ESC>
imap Jk <ESC>
imap JK <ESC>

nmap <leader>n :NERDTreeToggle<CR> " leader-n toggles nerdtree
nmap <leader>q :wqa!<CR>           " easier quit-and-save
nmap <leader>w :w!<CR>             " easier write
nmap <leader><Esc> :q!<CR>         " easier quit-and-not-save

