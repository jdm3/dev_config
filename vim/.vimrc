" Global
set nocompatible        " start out not in VI compatible mode
behave mswin            " set mouse behaviour similar to windows
let mapleader=","       " use , for in any commands that specify via <leader>

" setup pathogen
call pathogen#infect()

" setup argwrap
let g:argwrap_line_prefix=""        " prefix for new lines
let g:argwrap_padded_braces=""      " types of braces that require padding
let g:argwrap_tail_comma=0          " does closing brace require comma
let g:argwrap_wrap_closing_brace=0  " put closing brace on new line
nnoremap <silent> <leader>f :ArgWrap<cr>

" Colors and formatting
syntax enable       " enable syntax highlighting keeping current color
                    " settings (use syntax on to overrule settings with defaults)
set cinwords=       " these keywords start an extra indent in the next line

" :N   place case labels N characters from indent of the switch
" lN   if non-zero, align with case label instead of statement after it
" gN   place C++ scope declarations N characters from indent of block they are in
" (N   when in unclosed parentheses, indent N characters from the line (add shiftwidth)
"...
set cinoptions=:0,l1,g0,(0,u0,U1,w1,Ws,M1,c0,C1

" Editing
set backspace=indent,eol,start  " allow backspace over these elements
set shiftwidth=4                " how many columns reindent operations (e.g., >>) shift the text
set tabstop=4                   " number of spaces used for tab character read from file
set softtabstop=4               " number of spaces used for tab character written while editing
set expandtab		            " convert tabs to spaces when editing

" Display
set nocursorline    " don't highlight line cursor is on
set number          " show line numbers
set ruler		    " show line and column number on status line
set noshowmatch     " don't highlight matching parenthesis-like characters, does this anyway and setting this slows down formatting
set showcmd		    " show last command entered in bottom right
set wildmenu        " show graphical menu of options for auto-complete

" Files
filetype plugin indent on   " turn on file type detection and custom indentation
set autoread                " automatically read file changes made outside of vim
set autowrite               " write changes on :next, etc.
set encoding=utf-8          " vim text character encoding
set fileformats=unix,dos    " eol characters to try when reading a file
set nobackup                " make a backup before overwriting a file.
set nowritebackup           " write files directly (instead of write to backup and overwrite)

" Macros
set history=50	    " keep 50 lines of command line history
set lazyredraw      " don't refresh screen during macros

" Searching
set incsearch	                    " start searching as characters are entered
set hlsearch                        " highlight matches
map <MiddleMouse> :nohlsearch<cr>
                                    " clear search highlighting with middle mouse click

" Folding
set nofoldenable    " disable folding




autocmd FileType * set formatoptions=tq

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" shell helpers
map <F7> Oprintf("DEBUG: %s(%d)\n", __FILE__, __LINE__);<esc>k/printf("DEBUG: .s(.d)\\n", __FILE__, __LINE__);<cr>jj

" big windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-]> <C-W><C-]>
map _ <C-W>_
set winminheight=0
set winminwidth=0
set winheight=999

map <F8> :cn<cr>

set tags=./tags;/

"autocmd QuickFixCmdPost make cwindow 5

map <leader>l :set background=light<cr>
map <leader>d :set background=dark<cr>

