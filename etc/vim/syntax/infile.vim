" Vim syntax file
" Language:	infile
" Maintainer:	Johannes Steudle
" Last Change:	2010 May 20

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful infile keywords
syn keyword	basicKeyword NumX NumY NumZ LengthX LengthY LengthZ AMR.C.enabled AMR.C.rootcells AMR.C.coarsenskip
 
syn match	numbers	display transparent "\<\d\|\.\d" contains=number,float
syn match	number		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match	float		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	float		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	float		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	float		display contained "\d\+e[-+]\=\d\+[fl]\=\>"

syn match basicComment "#.*$"

hi def link basicKeyword		Statement
hi def link basicComment		Comment
