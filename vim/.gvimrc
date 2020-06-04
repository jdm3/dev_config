set ch=1
set mousehide

" WARNING: don't use autoselect (a), scrolling in visual mode is slow
set guioptions=
set guioptions+=!   " external commands in terminal window
set guioptions+=g   " show inactive menu items grey
set guioptions+=m   " menu bar
set guioptions+=r   " right hand scroll bar
set guioptions+=L   " left-hand scroll bar when vertically split
set guioptions+=k   " keep window size when adding/removing scroll bars
set columns=120
set lines=50

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

let c_comment_strings=1

syntax reset
colorscheme solarized8_flat

"autocmd BufEnter *.{h,c,cpp} highlight link StyleViolation SpellBad
"autocmd BufEnter *.{h,c,cpp} match StyleViolation /\%81v.\+\|\t\|\s\+$/
"autocmd InsertEnter *.{h,c,cpp} match StyleViolation /\%81v.\+\|\t\|\s\+\%#\@<!$/
"autocmd InsertLeave *.{h,c,cpp} match StyleViolation /\%81v.\+\|\t\|\s\+$/

function! IncreaseFontSize(amount)
    let g:MyFontSize=g:MyFontSize+a:amount
    execute 'set guifont=' . g:MyFont . ':h' . g:MyFontSize . ':cANSI'
endfunction

let g:MyFont='Envy_Code_R'
let g:MyFontSize=10
call IncreaseFontSize(0)

map - :call IncreaseFontSize(-1)<cr>
map + :call IncreaseFontSize(1)<cr>

" Maximize all windows
if &diff
    set lines=999 columns=999
endif

" -----------------------------------------------------------------------------
" YouCompleteMe

set completeopt-=preview       " don't open extra complete info in preview/scratch window

let g:ycm_use_clangd=1
let g:ycm_clangd_binary_path="C:/Program Files/LLVM/bin/clangd.exe"

let g:ycm_auto_hover=''

let g:ycm_enable_diagnostic_signs=1
set signcolumn=no
let g:ycm_error_symbol='>'
let g:ycm_warning_symbol='>'

function! SetYcmHighlights()
    highlight YcmErrorSign      guifg=#cb4b16
    highlight YcmWarningSign    guifg=#b58900
    highlight YcmErrorSection   gui=undercurl guisp=#cb4b16
    highlight YcmWarningSection gui=undercurl guisp=#b58900
endfunction
call SetYcmHighlights()
nmap <leader>l :set background=light<cr>:call SetYcmHighlights()<cr>
nmap <leader>d :set background=dark<cr>:call SetYcmHighlights()<cr>

"nnoremap <F5> :YcmForceCompileAndDiagnostics<cr>

packadd YouCompleteMe

