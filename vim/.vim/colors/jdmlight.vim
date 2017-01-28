set background=light
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="jdmlight"

hi Normal guifg=darkblue guibg=white gui=none
 
hi Cursor guifg=black guibg=green gui=none
hi lCursor guifg=black guibg=cyan gui=none

hi IncSearch guifg=fg guibg=bg gui=reverse
hi Search guifg=black guibg=Yellow gui=none
hi ModeMsg guifg=fg guibg=bg gui=bold
hi ErrorMsg guifg=white guibg=Red gui=none

"hi PreProc
hi cPreProc guifg=#a020f0 guibg=lightgray gui=none
hi PreCondit guifg=#a020ff guibg=#eeeeee gui=none
"hi Include
hi cInclude guifg=#a020f0 guibg=lightgray gui=none
hi cIncluded guifg=#a020f0 guibg=lightgray gui=none
"hi Define
hi cDefine guifg=#f020ff guibg=#eeeeee
"hi Macro

hi Folded guifg=darkblue guibg=lightgrey gui=none
hi FoldColumn guifg=darkblue guibg=grey gui=none

hi Comment guifg=grey guibg=bg gui=none
hi cComment guifg=grey guibg=bg gui=none
"hi cCommentL
"hi cCommentString
"hi cComment2String
"hi cCommentStart
"hi cCommentSkip
hi cCommentStartError guifg=black guibg=red gui=bold
hi cCppSkip guifg=grey guibg=bg gui=none
hi cCppOut guifg=grey guibg=bg gui=none
hi cCppOut2 guifg=grey guibg=bg gui=none

hi Constant guifg=#c07070 guibg=bg gui=none
"hi cConstant guifg=#a0a0ff guibg=bg
"hi String guifg=#ffa0a0
""hi cString
""hi cCppString
"hi cFormat guifg=#ffdda0 guibg=bg
"hi cSpecial guifg=#ffa0dd guibg=bg
"hi Character guifg=#ff6060
""hi cCharacter
"hi cSpecialCharacter guifg=white
"hi cSpecialError guifg=red guibg=green gui=none
hi Number guifg=lightred guibg=bg gui=bold
""hi cNumber
""hi cppNumber
"hi Float guifg=#50ff50
""hi cFloat
"hi Boolean guifg=#a0a0ff
""hi cppBoolean
"hi cOctal guifg=#ff9000
"hi cOctalError guifg=red guibg=green gui=none

hi Identifier guifg=darkgreen guibg=bg gui=none

hi Structure guifg=orangered guibg=lightgrey gui=italic

hi Statement guifg=blue guibg=bg gui=bold,underline
hi cStatement guifg=blue guibg=bg gui=bold,underline
hi csStatement guifg=blue guibg=bg gui=bold,underline
hi cppStatement guifg=blue guibg=bg gui=bold,underline

"hi Typedef

hi Type guifg=blue guibg=bg gui=none
hi cType	guifg=blue guibg=bg gui=none
hi csType guifg=blue guibg=bg gui=none
hi cppType guifg=blue guibg=bg gui=none

hi cppAccess guifg=lightblue guibg=bg gui=italic
hi StorageClass guifg=lightblue guibg=bg gui=italic
hi cStorageClass guifg=lightblue guibg=bg gui=italic
hi csStorageClass guifg=lightblue guibg=bg gui=italic
hi cppStorageClass guifg=lightblue guibg=bg gui=italic

"hi Conditional guifg=#66bb77 guibg=bg gui=bold,underline
"hi cConditional guifg=#66bb77 guibg=bg gui=bold,underline
"hi Repeat guifg=#6677bb guibg=bg gui=bold,underline
"hi cRepeat guifg=#6677bb guibg=bg gui=bold,underline
"hi Label guifg=navajowhite guibg=bg gui=underline,bold
"hi cLabel guifg=navajowhite guibg=bg gui=underline,bold
"hi cUserLabel guifg=navajowhite guibg=bg gui=underline,bold

"hi Operator guifg=khaki guibg=bg gui=bold
"hi cOperator guifg=khaki guibg=bg gui=bold
"hi cppOperator guifg=khaki guibg=bg gui=bold

hi Keyword guifg=orangered guibg=cyan gui=underline

hi Special guifg=darkorange guibg=grey80 gui=none
hi Ignore guifg=grey90 guibg=bg gui=none
"hi Todo guifg=orangered guibg=yellow2

"hi Exception guifg=yellow guibg=bg gui=none

"hi cppCast guifg=gold guibg=bg gui=none

hi Directory guifg=red guibg=bg gui=none

hi MoreMsg guifg=seagreen guibg=bg gui=bold

hi Visual guifg=grey guibg=fg gui=reverse
hi VisualNOS guifg=fg guibg=bg gui=underline,bold

hi StatusLine guifg=white guibg=darkgray gui=underline,bold
hi StatusLineNC guifg=darkgray guibg=lightgray
hi VertSplit guifg=fg guibg=bg gui=reverse

"hi Error guifg=red guibg=green gui=none

"hi cErrInBracket	guifg=red guibg=green gui=none
"hi cErrInParen guifg=red guibg=green gui=none
"hi cSpaceError guifg=red guibg=green gui=none
"hi cCommentError	guifg=red guibg=green gui=none
"hi cParenError guifg=red guibg=green gui=none
"hi cError guifg=red guibg=green gui=none

hi Function  guifg=darkgreen guibg=bg gui=none

hi LineNr guifg=lightred guibg=bg gui=none


hi Question guifg=magenta guibg=bg gui=bold
hi Title guifg=magenta guibg=bg gui=bold
hi WarningMsg guifg=red guibg=bg gui=none
hi WildMenu guifg=black guibg=yellow gui=none
hi DiffAdd guifg=fg guibg=darkblue gui=none
hi DiffChange guifg=fg guibg=darkmagenta gui=none
hi DiffDelete guifg=blue guibg=darkcyan gui=bold
hi DiffText guifg=fg guibg=red gui=bold
"hi Underlined  guifg=white guibg=green gui=none

hi Tag guifg=gold guibg=green gui=none

hi SpecialChar guifg=darkgrey guibg=bg gui=bold
"hi Delimiter guifg=blue guibg=bg gui=none
"hi SpecialComment guifg=gold guibg=bg gui=none
"hi Debug guifg=purple guibg=bg gui=none

"hi cTodo	guifg=yellow guibg=green gui=none
"hi cOctalZero guifg=yellow guibg=green gui=none

"hi cppExceptions	guifg=yellow guibg=green gui=none

hi NonText guifg=lightblue guibg=grey90 gui=bold
hi SpecialKey guifg=blue guibg=bg gui=none

hi MatchParen guifg=black guibg=lightyellow gui=none


