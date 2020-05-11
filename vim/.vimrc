" Start out not in VI compatible mode.  Should be first, as it changes other
" options as a side effect.
set nocompatible

" Remove existing autocmds to avoid duplicates
autocmd!

" Set mouse behaviour similar to windows
behave mswin

" Use , for any commands that specify via <leader>
let mapleader=","

" Enable syntax highlighting keeping current color settings (use syntax on to
" overrule settings with defaults)
syntax enable

" These keywords start an extra indent in the next line
set cinwords=

" :N   place case labels N characters from indent of the switch
" lN   if non-zero, align with case label instead of statement after it
" gN   place C++ scope declarations N characters from indent of block they are in
" (N   when in unclosed parentheses, indent N characters from the line (add shiftwidth)
"...
set cinoptions=:0,l1,g0,(0,u0,U1,w1,Ws,M1,c0,C1

" Editing
"set autoindent
"set smartindent
"set smarttab
set backspace=indent,eol,start  " allow backspace over these elements
set expandtab                   " convert tabs to spaces when editing
set history=50                  " Keep 50 lines of command line history
set shiftwidth=4                " how many columns reindent operations (e.g., >>) shift the text
set softtabstop=4               " number of spaces used for tab character written while editing
set tabstop=4                   " number of spaces used for tab character read from file

" Display
set gcr=a:blinkon0  " Disable cursor blink
set lazyredraw      " Don't refresh screen during macros
set nocursorline    " Don't highlight line cursor is on
set noshowmatch     " Don't highlight matching parenthesis-like characters, does this anyway and setting this slows down formatting
set number          " Show line numbers
set showcmd         " Show last command entered in bottom right
set showmode        " Show current mode in bottom right
set wildmenu        " Show graphical menu of options for auto-complete

set laststatus=2    " Always show statusline
set statusline=
set statusline+=%#StatusLineNC#
set statusline+=%<%f
set statusline+=%#VertSplit#
set statusline+=\ %h%m%r%=%{&fileencoding?&fileencoding:&encoding}\ \[%{&fileformat}\]
set statusline+=%#StatusLine#
set statusline+=\ %3.c\ %4.l
set statusline+=%#StatusLineNC#
set statusline+=/%4.L

" Searching
set incsearch                       " start searching as characters are entered
set hlsearch                        " highlight matches
map <MiddleMouse> :nohlsearch<cr>   " clear search highlighting with middle mouse click

" Disable folding
"set nofoldenable

" Files
filetype plugin indent on   " turn on file type detection and custom indentation
set autoread                " automatically read file changes made outside of vim
set autowrite               " write changes on :next, etc.
set encoding=utf-8          " vim text character encoding
set fileformats=dos,unix    " eol characters to try when reading a file
set nobackup                " make a backup before overwriting a file.
set nowritebackup           " write files directly (instead of write to backup and overwrite)
"set noswapfile

" NOTE: FileType autocmds must be after filetype command
" Disable automatic comment on new lines created by <Enter> in insert mode
" Disable automatic comment on new lines created by o or O
autocmd FileType * set formatoptions-=ro

" Treat .cshtml files as html syntax
autocmd BufReadPost *.cshtml set syntax=html

" Window switching shortcuts: e.g.: ctrl-j instead of ctrl-w j
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-_> <C-W>_
map <C-=> <C-W>=

" Shortcuts for switching background light/dark
nmap <leader>l :set background=light<cr>
nmap <leader>d :set background=dark<cr>

" Diff/merge
nmap <leader>n ]c
nmap <leader>p [c

if &diff
    nmap <leader>u :update<cr>
    nmap <leader>q :update<cr>:qa<cr>
    nmap <leader>1 :diffget 1<cr>]c
    nmap <leader>2 :diffget 2<cr>]c
    nmap <leader>3 :diffget 3<cr>]c
    autocmd VimResized * wincmd =
else
    " When editing a file, jump to last known cursor position unless the
    " position is invalid or inside an event handler (which happens when
    " dropping a file onto gvim icon in windows).
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" Allow windows to have zero size
set winminheight=0
set winminwidth=0

" Enlarge the the active window to full
if &diff == 0
    set winheight=999
endif

" ctrlp
let g:ctrlp_working_path_mode='rac'
let g:ctrlp_switch_buffer='E'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|dll|so|swp|zip)$',
    \ }

" vim-argwrap
let g:argwrap_wrap_closing_brace=0
nnoremap <silent> <leader>a :ArgWrap<cr>

" VimCompletesMe
let g:vcm_s_tab_behavior=1

" vim-gitgutter
let g:gitgutter_log=1
set signcolumn=yes
set updatetime=500

" vim-gutentags
" :GutentagsUpdate to update file
" :GutentagsUpdate! to update project
let g:gutentags_ctags_tagfile='.tags'

