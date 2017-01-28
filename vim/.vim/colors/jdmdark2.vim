set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="jdmdark"

hi Normal				guifg=#dcdccc	guibg=#404040	gui=none

hi Cursor				guifg=bg		guibg=gold		gui=bold
""hi lCursor
hi MatchParen			guifg=#ffffaa	guibg=#000000	gui=bold

"						guifg=#606060
hi Comment				guifg=#7f9f7f	guibg=bg		gui=italic
"	hi cCppOut			guifg=#7f9f7f	guibg=bg		gui=italic
"	hi cCppOut2			guifg=#7f9f7f	guibg=bg		gui=italic
"	hi cCppSkip			guifg=#7f9f7f	guibg=bg		gui=italic
"	hi cComment			guifg=#7f9f7f	guibg=bg		gui=italic
"	hi cCommentSkip		guifg=#7f9f7f	guibg=bg		gui=italic
"	hi cCommentL		guifg=#7f9f7f	guibg=bg		gui=italic
"	hi cCommentStart	guifg=#7f9f7f	guibg=bg		gui=italic
hi cCommentString		guifg=#7f9f7f	guibg=bg		gui=italic
hi cComment2String		guifg=#7f9f7f	guibg=bg		gui=italic

hi Constant				guifg=#dca3a3	guibg=bg		gui=none
	"hi cConstant		guifg=#dca3a3	guibg=bg		gui=none

hi String				guifg=#cc9393	guibg=bg		gui=none
"	hi cString			guifg=#cc9393	guibg=bg		gui=none
"	hi cCppString		guifg=#cc9393	guibg=bg		gui=none
hi cIncluded			guifg=#aabbcc	guibg=#343434	gui=none

hi Character			guifg=#ffc3a3	guibg=bg		gui=none
"	hi cCharacter		guifg=#ffc3a3	guibg=bg		gui=none

hi Number				guifg=#8cd0d3	guibg=bg		gui=none
"	hi cNumber			guifg=#8cd0d3	guibg=bg		gui=none
"	hi cppNumber		guifg=#8cd0d3	guibg=bg		gui=none
"	hi cOctal			guifg=#8cd0d3	guibg=bg		gui=none

hi Float				guifg=#d0aed1	guibg=bg		gui=none
"	hi cFloat			guifg=#d0aed1	guibg=bg		gui=none

hi Boolean				guifg=#a0a0ff	guibg=bg		gui=none
"	hi cppBoolean		guifg=#a0a0ff	guibg=bg		gui=none

hi Special				guifg=yellow	guibg=red		gui=bold,underline
"	hi Tag				guifg=yellow	guibg=red		gui=bold,underline
"	hi SpecialChar		guifg=yellow	guibg=red		gui=bold,underline
"	hi Delimiter		guifg=yellow	guibg=red		gui=bold,underline
"	hi SpecialComment	guifg=yellow	guibg=red		gui=bold,underline
"	hi Debug			guifg=yellow	guibg=red		gui=bold,underline
"	hi cSpecial			guifg=#ffa0dd	guibg=bg
"	hi cFormat			guifg=#ffdda0	guibg=bg
"	hi cSpecialCharacter guifg=white

hi Identifier			guifg=#efefbc	guibg=bg		gui=none
"hi Function 			guifg=#bcefbc	guibg=bg		gui=none
hi Function 			guifg=yellow	guibg=red		gui=none

hi Statement			guifg=#e3ceab	guibg=bg		gui=bold,underline
"	hi Keyword			guibg=cyan
"	hi Exception		guifg=yellow	guibg=bg		gui=none
"	hi cStatement		guifg=khaki		guibg=bg		gui=bold
"	hi cppStatement		guifg=khaki		guibg=bg		gui=bold
"	hi cppAccess		guifg=khaki		guibg=bg		gui=italic
"	hi cppExceptions	guifg=yellow	guibg=bg		gui=none
"	hi cppCast			guifg=gold		guibg=bg		gui=none
hi Conditional			guifg=#f0dfaf	guibg=bg		gui=bold,underline
"	hi cConditional		guifg=#66bb77	guibg=bg		gui=bold,underline
hi Repeat				guifg=#f0dfaf	guibg=bg		gui=bold,underline
"	hi cRepeat			guifg=#6677bb	guibg=bg		gui=bold,underline
hi Label				guifg=#e3ceab	guibg=bg		gui=italic,underline
"	hi cLabel			guifg=#e3ceab	guibg=bg		gui=underline,bold
"	hi cUserLabel		guifg=#e3ceab	guibg=bg		gui=underline,bold
hi Operator				guifg=#ffffff	guibg=#000000	gui=bold
"	hi cOperator		guifg=khaki		guibg=bg		gui=bold
"	hi cppOperator		guifg=khaki		guibg=bg		gui=bold

hi PreProc				guifg=#6699cc	guibg=#343434	gui=none
"	hi Include			guifg=#6699cc	guibg=#343434	gui=none
"	hi Macro			guifg=#6699cc	guibg=#343434	gui=none
"	hi PreCondit		guifg=#6699cc	guibg=#343434	gui=none
"	hi cPreProc			guifg=#6699cc	guibg=#343434	gui=none
"	hi cInclude			guifg=#6699cc	guibg=#343434	gui=none
hi Define				guifg=#2255aa	guibg=#343434	gui=none
hi cDefine				guifg=#2255aa	guibg=#343434	gui=none

hi Type					guifg=#ddaa77	guibg=bg		gui=none
"	hi cType			guifg=#cc8855		guibg=green	gui=bold
"	hi cppType			guifg=#aa6633		guibg=green	gui=bold
hi Structure			guifg=#ddaa77	guibg=#343434	gui=bold
"	hi cStructure		guifg=navajowhite	guibg=green			gui=italic
"	hi cppStructure		guifg=navajowhite	guibg=green			gui=italic
hi StorageClass			guifg=#bb8855	guibg=bg		gui=italic
"	hi cStorageClass	guifg=#ddaa77       guibg=green
"	hi cppStorageClass	guifg=#ddaa77       guibg=green
hi Typedef				guibg=white			guibg=yellow

hi Underlined 			guifg=#ffffff	guibg=#000000	gui=bold,underline

hi Error					guifg=#e37170	guibg=#332323	gui=none
	"hi cError				guifg=#d37170	guibg=#332323	gui=none
	"hi cSpecialError		guifg=#d37170	guibg=#332323	gui=none
	"hi cParenError			guifg=#d37170	guibg=#332323	gui=none
	"hi cCommentStartError	guifg=#d37170	guibg=#332323	gui=none
	"hi cOctalError			guifg=#d37170	guibg=#332323	gui=none
	"hi cErrInBracket		guifg=#d37170	guibg=#332323	gui=none
	"hi cErrInParen			guifg=#d37170	guibg=#332323	gui=none
	"hi cSpaceError			guifg=#d37170	guibg=#332323	gui=none
	"hi cCommentError		guifg=#d37170	guibg=#332323	gui=none

hi Todo			guifg=orangered	guibg=yellow2	gui=none

"hi cBlock		guifg=black		guibg=magenta	gui=bold,underline,italic
"hi cUserCont	guifg=black		guibg=magenta	gui=bold,underline,italic
"hi cBitField	guifg=black		guibg=magenta	gui=bold,underline,italic
"hi cNumbersCom	guifg=black		guibg=magenta	gui=bold,underline,italic
"hi cParen		guifg=black		guibg=magenta	gui=bold,underline,italic
"hi cCppBracket	guifg=black		guibg=magenta	gui=bold,underline,italic
"hi cCppParen	guifg=black		guibg=magenta	gui=bold,underline,italic
"hi cBracket	guifg=black		guibg=magenta	gui=bold,underline,italic
"hi cNumbers	guifg=black		guibg=magenta	gui=bold,underline,italic
"hi cMulti		guifg=black		guibg=magenta	gui=bold,underline,italic
"hi cppMinMax	guifg=black		guibg=magenta	gui=bold,underline,italic

hi Visual				guifg=#808040	guibg=#101010	gui=none
hi VisualNOS			guifg=#808040	guibg=#101010	gui=none
hi IncSearch			guifg=#ffff80	guibg=#303000	gui=underline
hi Search				guifg=#ffff80	guibg=#303000	gui=underline

hi SpecialChar		guifg=#dca3a3 gui=bold
hi NonText			guifg=bg		guibg=bg		gui=none
hi ErrorMsg			guifg=#6699ff	guibg=#161616	gui=bold,italic
hi Directory		guifg=#dcdccc					gui=bold
hi MoreMsg			guifg=#ffffff					gui=bold
hi Pmenu			guibg=#2c2e2e guifg=#9f9f9f
hi PMenuSel			guibg=#242424 guifg=#d0d0a0 gui=bold
hi PmenuSbar		guibg=#2e3330 guifg=#000000
hi PMenuThumb		guibg=#a0afa0 guifg=#040404 

hi StatusLine			guifg=#808050	guibg=#282828	gui=none
hi StatusLineNC			guifg=#808050	guibg=#282828	gui=none
hi VertSplit			guifg=#808050	guibg=#282828	gui=none

"hi Ignore		guifg=black
""hi cTodo	guifg=yellow			guibg=green			gui=none
"
"
"hi cErrInBracket	guifg=red			guibg=green			gui=none
"hi cErrInParen		guifg=red			guibg=green			gui=none
"hi cSpaceError		guifg=red			guibg=green			gui=none
"

hi LineNr		guifg=#606060	guibg=bg		gui=none

"hi Question		guifg=white			guibg=green			gui=none
""hi Question        guifg=#ffffff gui=bold
"hi Title		guifg=white			guibg=green			gui=none
""hi Title           guifg=#efefef gui=bold
"hi WarningMsg		guifg=white			guibg=green			gui=none
""hi WarningMsg      guifg=#ffffff guibg=#333333 gui=bold
"hi WildMenu 		guifg=white			guibg=green			gui=none
""hi WildMenu        guibg=#2c302d guifg=#cbecd0 gui=underline
""hi CursorLine      guibg=#434443
"
"hi DiffAdd		guifg=white			guibg=green			gui=none
""hi DiffAdd         guifg=#709080 guibg=#313c36 gui=bold
"hi DiffChange		guifg=white			guibg=green			gui=none
""hi DiffChange      guibg=#333333
"hi DiffDelete		guifg=blue			guibg=green			gui=none
""hi DiffDelete      guifg=#333333 guibg=#464646
"hi DiffText 		guifg=darkgreen			guibg=green			gui=none
""hi DiffText        guifg=#ecbcbc guibg=#41363c gui=bold


"hi Tag	guifg=gold			guibg=green			gui=none
""hi Tag             guifg=#e89393 gui=bold
"
"hi SpecialChar		guifg=blue			guibg=bg			gui=none
""hi SpecialKey      guifg=#9ece9e
"hi Delimiter		guifg=blue			guibg=bg			gui=none
""hi Delimiter       guifg=#8f8f8f
"hi SpecialComment		guifg=gold			guibg=bg			gui=none
""hi SpecialComment  guifg=#82a282 gui=bold
"hi Debug		guifg=purple			guibg=bg			gui=none
""hi Debug           guifg=#bca3a3 gui=bold
"
"hi cOctalZero		guifg=yellow			guibg=green			gui=none
"
"hi cppExceptions	guifg=yellow			guibg=green			gui=none

""hi ModeMsg			guifg=#6699ff	guibg=#161616	gui=bold,italic

"hi Folded				guifg=slateblue	guibg=#191919	gui=bold
"hi FoldColumn			guifg=slateblue	guibg=#191919	gui=bold

