" Highlight my debug macros.

" A group with things that are normally already excluded from cParen.
syn cluster cwNotInParen contains=@cParenGroup,cCppParen,cErrInBracket,cCppBracket,@cStringGroup,@Spell

" Create a new cParen syntax group that will have Debug highlighting.
syn region cwDebugParen transparent matchgroup=cwDebugParenDelim contains=ALLBUT,@cwNotInParen
\       start='(' end=')'me=s-1

" Define cParen last, so it will overrule the previous one.
syn clear cParen
syn region cParen transparent contains=ALLBUT,@cwNotInParen,cwDebugParen
\       start='(' end=')'

" Redefine cCppParen to also exclude cwDebugParen
syn clear cCppParen
syn region cCppParen transparent contained contains=ALLBUT,@cParenGroup,cErrInBracket,cParen,cwDebugParen,cBracket,cString,@Spell
\       start='(' skip='\\$' excludenl end=')' end='$'

" Redefine cCppBracket to also exclude cwDebugParen.
syn clear cCppBracket
syn region cCppBracket transparent contained contains=ALLBUT,@cParenGroup,cErrInParen,cParen,cwDebugParen,cBracket,cString,@Spell
\       start='\[\|<::\@!' skip='\\$' excludenl end=']\|:>' end='$'

" Add a syntax group for "Debug( ... );".
syn region cwDebugMacros transparent matchgroup=cwDebugMacrosDelim contains=cwDebugParen
\       start="\v\W(Debug|DoutFatal|DoutEntering|Dout|ASSERT|assert|DEBUG_ONLY)\(@="hs=s+1
\       start="\v^(Debug|DoutFatal|DoutEntering|Dout|ASSERT|assert|DEBUG_ONLY)\(@="
\       end="\v\);?"

syn match cwVoidArgument '(void)' contains=None

hi def link cwDebugMacrosDelim Debug       " Highlight 'Debug' and the close paren of that macro.
hi def link cwDebugParenDelim Debug        " Highlight the open paren of the Debug macro.
hi def link cwVoidArgument cError          " Style: Highlight '(void)' because that should always be '()'.
