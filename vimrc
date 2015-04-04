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
set clipboard=unnamed " Use system clipboard
syntax enable         " Turn on syntax highlighting allowing local overrides

" Folding settings
set foldmethod=syntax " Use syntax-provided folding when available
set foldlevel=99      " Folds are open by default
set foldlevelstart=99 " Folds are open by default (new way)

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

set autoindent
set mouse=a     " Use the mouse inside iterm2

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
  filetype plugin indent on           " allow for individual indentations per file type

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

" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell

" key settings

let mapleader=","              " set the <leader> key to comma

" Map ESC to jk
imap jk <ESC>
imap Jk <ESC>
imap JK <ESC>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap J gj
nnoremap k gk
nnoremap K gk

" Capslock H and L are just stupid LOL
nnoremap H h
nnoremap L l

" Do not exit visual mode when shifting
vnoremap < <gv
vnoremap > >gv

" comma q quits and saves, comma w saves without warnings
nmap <leader>q :q!<CR>
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

" deactivate 'Entering Ex mode' prompt
:map Q <Nop>

" Syntactic plugin
"   Suppress html warnings due to angular custom fields
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Use the location list instead of the quickfix list for syntastic (otherwise
" it can override :grep results)
let g:syntastic_auto_loc_list=1

" Markdown plugin
"   Do not start with everything folded
let g:vim_markdown_initial_foldlevel=99

" Neocomplete configuration
" -------------------------
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Enable neocomplete.
let g:neocomplete#enable_smart_case = 1 " Enable smartcase in neocomplete.
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_cursor_hold_i = 1  " Wait a little before showing the autocomplete
let g:neocomplete#cursor_hold_i_time = 300  " How much time before showing the autocomplete (in ms)

" Define what is considered a keyword for neocomplete
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  " For inserting the <CR>:
  " return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" ctrlp configuration
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$' }
" Set delay to prevent extra search
let g:ctrlp_lazy_update = 100

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
  let g:ctrlp_use_caching = 0 " Ag is fast enough to not needing caching
else
  let g:ctrlp_user_command = {
      \ 'types': {
          \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
          \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
  \ }
endif

" use lua matcher
let g:ctrlp_match_func = { 'match': 'ctrlp#luamatcher#Match' }

" The :G command is like :grep, but silent, and opens the quickfix window
" instead of the first matching result
command! -nargs=+ G execute 'silent grep! <args>' | copen 42

" Auto-adjust the quickfix window height
au FileType qf call AdjustWindowHeight(3, 10)
 function! AdjustWindowHeight(minheight, maxheight)
     let l = 1
     let n_lines = 0
     let w_width = winwidth(0)
     while l <= line('$')
         " number to float for division
         let l_len = strlen(getline(l)) + 0.0
         let line_width = l_len/w_width
         let n_lines += float2nr(ceil(line_width))
         let l += 1
     endw
     exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
 endfunction

" Neosnippet configuration
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
