" Vim syntax file
" Language:     Haskell
" Maintainer:   Rui Carlos A. Goncalves <rcgoncalves.pt@gmail.com>
" Last Change:  September 15, 2010
"
" Version:      2.0
" Url:          http://rcgoncalves.net/files/haskell.zip
"
" Original Author: John Williams <jrw@pobox.com>

" Remove any old syntax stuff hanging around
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif


" (Qualified) identifiers (no default highlighting)
syn match ConId         "\(\<[A-Z][a-zA-Z0-9_']*\.\)\=\<[A-Z][a-zA-Z0-9_']*\>"
syn match VarId         "\(\<[A-Z][a-zA-Z0-9_']*\.\)\=\<[a-z][a-zA-Z0-9_']*\>"


" Infix operators--most punctuation characters and any (qualified) identifier
" enclosed in `backquotes`. An operator starting with : is a constructor,
" others are variables (e.g. functions).
syn match nmVarSym      "\(\<[A-Z][a-zA-Z0-9_']*\.\)\=[-!#$%&\*\+/<=>\?@\\^|~.][-!#$%&\*\+/<=>\?@\\^|~:.]*"
syn match nmConSym      "\(\<[A-Z][a-zA-Z0-9_']*\.\)\=:[-!#$%&\*\+./<=>\?@\\^|~:]*"
syn match nmVarSym      "`\(\<[A-Z][a-zA-Z0-9_']*\.\)\=[a-z][a-zA-Z0-9_']*`"
syn match nmConSym      "`\(\<[A-Z][a-zA-Z0-9_']*\.\)\=[A-Z][a-zA-Z0-9_']*`"

" Reserved symbols--cannot be overloaded.
syn match nmDelimiter  "(\|)\|\[\|\]\|,\|;\|_\|{\|}"


" Strings and constants
syn match   nmSpecialChar	contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syn match   nmSpecialCharError	contained "\\&\|'''\+"
syn region  nmString		start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=hsSpecialChar
syn match   nmCharacter		"[^a-zA-Z0-9_']'\([^\\]\|\\[^']\+\|\\'\)'"lc=1 contains=hsSpecialChar,hsSpecialCharError
syn match   nmCharacter		"^'\([^\\]\|\\[^']\+\|\\'\)'" contains=hsSpecialChar,hsSpecialCharError
syn match   nmNumber		"\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn match   nmFloat		"\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"


" Keyword definitions. These must be patters instead of keywords
" because otherwise they would match as keywords at the start of a
" "literate" comment (see lhs.vim).
"syn match hsModule	"\<module\>"
"syn match hsImport	"\<import\>.*"he=s+6 contains=hsImportMod,hsString,hsType,hsFunction
"syn match hsImportMod	contained "\<\(as\|qualified\|hiding\)\>"
"syn match hsInfix	"\<\(infix\|infixl\|infixr\)\>"
syn match nmStructure	"\<\(proc\|class\|data\|deriving\|instance\|default\|where\|match\|with\)"
syn match nmTypedef	"\<\(type\|newtype\)\>"
syn match nmStatement	"\<\(do\|return\|case\|of\|let\|in\)\>"
syn match nmConditional	"\<\(if\|then\|else\|end\)\>"
" Haskell 2010 keywords
" syn match hsForeign	"\<foreign\>"

" Types from the standard prelude.
syn match nmType        "\<\(Bool\)\>"
syn match nmType        "\<\(Char\|String\|Int\|Integer\|Float\|Double\|Rational\|IO\)\>"

" Classes from the standard prelude
"syn match hsType        "\<\(Eq\|Ord\|Enum\|Bounded\|Num\|Real\|Integral\|Fractional\|Floating\|RealFrac\|RealFloat\|Monad\|Functor\)\>"
"syn match hsType        "\<\(Show\|Read\)\>"


" Constants from the standard prelude.
syn match nmBoolean     "\<\(True\|False\)\>"
"syn match hsMaybe       "\<\(Nothing\|Just\)\>"
"syn match hsConstant    "\<\(Left\|Right\)\>"
"syn match hsOrdering    "\<\(LT\|EQ\|GT\)\>"


" Functions from the standard prelude.
syn match nmFunction    "\<\(compare\|max\|min\|genpot\)\>"
syn match nmFunction    "\<\(get\|pay\|recv\|send\|acquire\|release\)\>"
syn match nmSimulate    "\<\(simulate\|simpay\|simget\|withdrawtoken\|wait\|close\|stype\)\>"
"syn match hsFunction    "\<\(succ\|pred\|toEnum\|fromEnum\|enumFrom\|enumFromThen\|enumFromTo\|enumFromThenTo\)\>"
"syn match hsFunction    "\<\(minBound\|maxBound\)\>"
"syn match hsFunction    "\<\(negate\|abs\|signum\|fromInteger\)\>"
"syn match hsFunction    "\<toRational\>"
"syn match hsFunction    "\<\(quot\|rem\|div\|mod\|quotRem\|divMod\|toInteger\)\>"
"syn match hsFunction    "\<\(recip\|fromRational\)\>"
"syn match hsFunction    "\<\(pi\|exp\|log\|sqrt\|logBase\|sin\|cos\|tan\|asin\|acos\|atan\|sinh\|cosh\|tanh\|asinh\|acosh\|atanh\)\>"
"syn match hsFunction    "\<\(properFraction\|truncate\|round\|ceiling\|floor\)\>"
"syn match hsFunction    "\<\(floatRadix\|floatDigits\|floatRange\|decodeFloat\|encodeFloat\|exponent\|significand\|scaleFloat\|isNaN\|isInfinite\|isDenormalized\|isIEEE\|isNegativeZero\|atan2\)\>"
syn match nmFunction    "\<\(return\|fail\)\>"
"syn match hsFunction    "\<\(fmap\)\>"
"syn match hsFunction    "\<\(mapM\|mapM_\|sequence\|sequence_\)\>"
"syn match hsFunction    "\<\(maybe\|either\)\>"
syn match nmFunction    "\<\(not\)\>"
"syn match hsFunction    "\<\(subtract\|even\|odd\|gcd\|lcm\)\>"
"syn match hsFunction    "\<\(fromIntegral\|realToFrac\)\>"
"syn match hsFunction    "\<\(fst\|snd\|curry\|uncurry\|id\|const\|flip\|until\)\>"
"syn match hsFunction    "\<\(asTypeOf\|error\|undefined\)\>"
"syn match hsFunction    "\<\(seq\)\>"
"syn match hsFunction    "\<\(map\|filter\|concat\|concatMap\)\>"
"syn match hsFunction    "\<\(head\|last\|tail\|init\|null\|length\)\>"
"syn match hsFunction    "\<\(foldl\|foldl1\|scanl\|scanl1\|foldr\|foldr1\|scanr\|scanr1\)\>"
"syn match hsFunction    "\<\(iterate\|repeat\|replicate\|cycle\)\>"
"syn match hsFunction    "\<\(take\|drop\|splitAt\|takeWhile\|dropWhile\|span\|break\)\>"
"syn match hsFunction    "\<\(lines\|words\|unlines\|unwords\|reverse\|and\|or\)\>"
"syn match hsFunction    "\<\(any\|all\|elem\|notElem\|lookup\)\>"
"syn match hsFunction    "\<\(sum\|product\|maximum\|minimum\)\>"
"syn match hsFunction    "\<\(zip\|zip3\|zipWith\|zipWith3\|unzip\|unzip3\)\>"
"syn match hsFunction    "\<\(readsPrec\|readList\)\>"
"syn match hsFunction    "\<\(showsPrec\|show\|showList\)\>"
"syn match hsFunction    "\<\(reads\|shows\|read\|lex\)\>"
"syn match hsFunction    "\<\(showChar\|showString\|readParen\|showParen\)\>"
"syn match hsFunction    "\<\(ioError\|userError\|catch\)\>"
"syn match hsFunction    "\<\(putChar\|putStr\|putStrLn\|print\)\>"
"syn match hsFunction    "\<\(getChar\|getLine\|getContents\|interact\)\>"
"syn match hsFunction    "\<\(readFile\|writeFile\|appendFile\|readIO\|readLn\)\>"


" Comments
syn match   nmLineComment      "--.*"
syn region  nmBlockComment     start="(\*"  end="\*)" contains=nmBlockComment
"syn region  hsPragma	       start="{-#" end="#-}"

" Literate comments--any line not starting with '>' is a comment.
"if exists("b:hs_literate_comments")
"  syn region  hsLiterateComment   start="^" end="^>"
"endif


"if !exists("hs_minlines")
"  let hs_minlines = 50
"endif
"exec "syn sync lines=" . hs_minlines

if version >= 508 || !exists("did_hs_syntax_inits")
  "if version < 508
  "  let did_hs_syntax_inits = 1
  "  command -nargs=+ HiLink hi link <args>
  "else
  "  command -nargs=+ HiLink hi def link <args>
  "endif

  hi link nmModule              nmStructure
  hi link nmImport              Include
  hi link nmImportMod           nmImport
  hi link nmForeign				nmImport
  hi link nmInfix               PreProc
  hi link nmStructure           Statement
  hi link nmStatement           Statement
  hi link nmConditional         Conditional
  hi link nmSpecialChar	        SpecialChar
  hi link nmTypedef             Typedef
  hi link nmVarSym              nmOperator
  hi link nmConSym              nmOperator
  hi link nmOperator            Operator
  hi link nmSpecialCharError    Error
  hi link nmString              String
  hi link nmCharacter           Character
  hi link nmNumber              Number
  hi link nmFloat               Float
  hi link nmConditional         Conditional
"  hi link nmLiterateComment     nmComment
  hi link nmBlockComment        nmComment
  hi link nmLineComment         nmComment
  hi link nmComment             Comment
  hi link nmPragma              SpecialComment
  hi link nmBoolean             Boolean
  hi link nmType                Type
  hi link nmForeignType		Type
  hi link nmFunction            Function
  hi link nmSimulate			Special
  hi link nmMaybe               nmEnumConst
  hi link nmOrdering            nmEnumConst
  hi link nmEnumConst           Constant
  hi link nmConstant            Constant
  hi link nmDebug               Debug

  "delcommand HiLink
endif

let b:current_syntax = "nomo"
