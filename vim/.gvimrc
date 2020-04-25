set ch=1
set mousehide

set guioptions+=a
set guioptions+=m
set guioptions+=g
set guioptions+=t
set guioptions+=r
set guioptions+=L
set guioptions-=T
set guioptions+=k
set columns=120
set lines=50

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

let c_comment_strings=1

syntax reset

set background=dark
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
