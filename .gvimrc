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

"colorscheme slate
"highlight MatchParen guibg=NONE guifg=#ffd700 gui=bold cterm=NONE

colorscheme onehalfdark
highlight MatchParen guibg=NONE guifg=#61afef gui=bold cterm=NONE
highlight StatusLine guifg=NONE guibg=#313640
highlight VertSplit guifg=#61afef guibg=#313640

"colorscheme morning

"if &diff
"    colorscheme solarized8_flat
"endif

"autocmd BufEnter *.{h,c,cpp} highlight link StyleViolation SpellBad
"autocmd BufEnter *.{h,c,cpp} match StyleViolation /\%81v.\+\|\t\|\s\+$/
"autocmd InsertEnter *.{h,c,cpp} match StyleViolation /\%81v.\+\|\t\|\s\+\%#\@<!$/
"autocmd InsertLeave *.{h,c,cpp} match StyleViolation /\%81v.\+\|\t\|\s\+$/

function! IncreaseFontSize(amount)
    let g:MyFontSize=g:MyFontSize+a:amount
    execute 'set guifont=' . g:MyFont . ':cANSI:qDRAFT:h' . g:MyFontSize
endfunction

"let g:MyFont='Envy_Code_R'
let g:MyFont='JetBrains_Mono_NL_ExtraLight:W200'
let g:MyFontSize=9
call IncreaseFontSize(0)

map - :call IncreaseFontSize(-1)<cr>
map + :call IncreaseFontSize(1)<cr>

" Maximize all windows
if &diff
    set lines=999 columns=999
endif
