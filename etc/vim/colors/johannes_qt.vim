" Vim color file
"
" Author: Johannes Steudle
"
" Note: personal theme
"

hi clear

set background=dark
if version > 700
    " no guarantees for version 7.0 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name="johannes_qt"


"hi Example        guifg=NONE    guibg=NONE    gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE

" normal text
hi Normal          guifg=#CCCCCC guibg=#020202 gui=NONE ctermfg=gray ctermbg=NONE cterm=NONE 
" like ~ @
hi NonText         guifg=#BCBCBC guibg=#232526 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" Character under cursor
hi Cursor          guifg=#0000F0 guibg=#00FFF0 gui=NONE ctermfg=black ctermbg=white cterm=reverse
" the screen line that the cursor is in when 'cursorline' is set
hi CursorLine      guifg=NONE    guibg=#282828 gui=NONE ctermfg=NONE ctermbg=darkgray cterm=NONE
" the screen column that the cursor is in when 'cursorcolumn' is set
hi CursorColumn    guifg=NONE    guibg=#293709 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi LineNr          guifg=#232526  guibg=#808080 gui=NONE ctermfg=gray ctermbg=NONE cterm=NONE
" status line of current window
hi StatusLine      guifg=#808080 guibg=#050559 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" status line of not current window
hi StatusLineNC    guifg=#808080 guibg=#212121 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" the column separating vertically split windows
hi VertSplit       guifg=#808080 guibg=#282828 gui=bold ctermfg=darkgray ctermbg=darkgray cterm=bold
" Visual mode selection
hi Visual          guifg=NONE    guibg=#403D3D gui=NONE ctermfg=NONE ctermbg=darkgray cterm=NONE
hi VisualNOS       guifg=NONE    guibg=#403D3D gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Search          guifg=#FFC7E1 guibg=#0097F1 gui=NONE ctermfg=red ctermbg=yellow cterm=underline
hi Title           guifg=#ef5939 guibg=NONE    gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Folded          guifg=#465457 guibg=#000000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpecialKey      guifg=#888A85 guibg=NONE    gui=italic ctermfg=NONE ctermbg=NONE cterm=NONE
hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold ctermfg=white ctermbg=darkgray cterm=bold

" directory names (and other special names in listings)
hi Directory       guifg=#A6E22E guibg=NONE    gui=bold ctermfg=NONE ctermbg=NONE cterm=bold

hi Error           guifg=#F2F2F2 guibg=#C4C4C4 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" error messages on the command line
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
" warning messages
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
" Message displayed in lower left, such as --INSERT--
hi ModeMsg         guifg=#E6FF04 guibg=NONE    gui=bold ctermfg=NONE ctermbg=NONE cterm=NONE
hi MoreMsg         guifg=#E6FF04 guibg=NONE    gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi WildMenu        guifg=#66D9EF guibg=#000000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" |hit-enter| prompt and yes/no questions
hi Question        guifg=#66D9EF guibg=NONE    gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Exception       guifg=#A6E22E guibg=NONE    gui=bold ctermfg=NONE ctermbg=NONE cterm=bold

hi FoldColumn      guifg=#465457 guibg=#000000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Ignore          guifg=#808080 guibg=bg      gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE

hi DiffAdd         guifg=NONE    guibg=#13354A gui=NONE ctermfg=green ctermbg=NONE cterm=NONE
hi DiffChange      guifg=#89807D guibg=#4C4745 gui=NONE ctermfg=blue ctermbg=NONE cterm=NONE
hi DiffDelete      guifg=#960050 guibg=#1E0010 gui=NONE ctermfg=lightred ctermbg=NONE cterm=NONE
hi DiffText        guifg=NONE    guibg=#4C4745 gui=italic,bold ctermfg=NONE ctermbg=NONE cterm=bold

" menu
hi Pmenu           guifg=#66D9EF guibg=#000000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuSel        guifg=NONE    guibg=#808080 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuSbar       guifg=NONE    guibg=#080808 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuThumb      guifg=#66D9EF guibg=NONE    gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE

" marks column
hi SignColumn      guifg=#A6E22E guibg=#232526 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpecialComment  guifg=#465457 guibg=NONE    gui=bold ctermfg=NONE ctermbg=NONE cterm=bold

" Syntax
hi Comment         guifg=#00F2FF guibg=NONE    gui=italic ctermfg=cyan ctermbg=NONE cterm=NONE
hi Constant        guifg=#AE81FF guibg=NONE    gui=bold ctermfg=cyan ctermbg=NONE cterm=bold
hi Conditional     guifg=#F0FF2A guibg=NONE    gui=none ctermfg=green ctermbg=NONE cterm=bold
hi Delimiter       guifg=#8F8F8F guibg=NONE    gui=NONE ctermfg=cyan ctermbg=NONE cterm=NONE
hi Function        guifg=#00E000 guibg=NONE    gui=NONE ctermfg=magenta ctermbg=NONE cterm=NONE
hi String          guifg=#E600F4 guibg=NONE    gui=NONE ctermfg=yellow ctermbg=NONE cterm=NONE
hi Number          guifg=#FFA0A0 guibg=NONE    gui=NONE ctermfg=lightmagenta ctermbg=NONE cterm=NONE
hi Keyword         guifg=#FFFFFF guibg=NONE    gui=bold ctermfg=green ctermbg=NONE cterm=bold
hi PreProc         guifg=#FF00FF guibg=NONE    gui=NONE ctermfg=lightred ctermbg=NONE cterm=NONE
hi Todo            guifg=#DDFF00 guibg=bg      gui=bold ctermfg=red ctermbg=NONE cterm=bold
hi Identifier      guifg=#FFFF00 guibg=NONE    gui=none ctermfg=brown ctermbg=NONE cterm=NONE
hi Type            guifg=#FFFF00 guibg=NONE    gui=none ctermfg=blue ctermbg=NONE cterm=bold
hi Statement       guifg=#FFFF00 guibg=NONE    gui=none ctermfg=green ctermbg=NONE cterm=bold
hi Special         guifg=#00FF00 guibg=bg      gui=italic ctermfg=white ctermbg=NONE cterm=NONE
hi Operator        guifg=#00F600 guibg=NONE    gui=NONE ctermfg=green ctermbg=NONE cterm=NONE
" hi cCustomFunc     guifg=#A050A0 guibg=NONE    gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi cCustomClass    guifg=#00F020  guibg=NONE    gui=none ctermfg=green ctermbg=NONE cterm=NONE

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Identifier " Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special
hi link cCustomFunc    Function 
" hi link cCustomClass   Function 
hi link IncSearch  Search

if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif

"
" miscellaneous
"
hi treeDir cterm=none ctermfg=Cyan
hi treeUp cterm=none ctermfg=DarkYellow
hi treeCWD cterm=none ctermfg=DarkYellow
hi netrwDir cterm=none ctermfg=Cyan

" Java
" hi link javaClassDecl    Type
hi link javaScopeDecl         Identifier 
hi link javaCommentTitle      javaDocSeeTag 
hi link javaDocTags           javaDocSeeTag 
hi link javaDocParam          javaDocSeeTag 
hi link javaDocSeeTagParam    javaDocSeeTag 

hi javaDocSeeTag guifg=#CCCCCC guibg=NONE gui=NONE ctermfg=darkgray ctermbg=NONE cterm=NONE
hi javaDocSeeTag guifg=#CCCCCC guibg=NONE gui=NONE ctermfg=darkgray ctermbg=NONE cterm=NONE
"hi javaClassDecl              guifg=#CCFFCC     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE

" XML
hi link xmlTag          Keyword 
hi link xmlTagName      Conditional 
hi link xmlEndTag       Identifier 

" HTML
hi link htmlTag         Keyword 
hi link htmlTagName     Conditional 
hi link htmlEndTag      Identifier 

"
" not used anymore
"
" hi cCustomFunc     guifg=#A050A0 guibg=NONE    gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" hi cCustomClass    guifg=#A050A0 guibg=NONE    gui=reverse ctermfg=NONE ctermbg=NONE cterm=NONE
" hi Character       guifg=#E6DB74
" hi Debug           guifg=#BCA3A3               gui=bold
" hi Define          guifg=#EC2AE9
" hi Label           guifg=#E6DB74               gui=none
" hi Macro           guifg=#EC2AE9               gui=italic
" hi PreCondit       guifg=#C036E2               gui=italic
" hi Repeat          guifg=#00F92A               gui=bold
" hi SpecialChar     guifg=#509999               "gui=bold
" hi Structure       guifg=#66D9EF
" hi StorageClass    guifg=#D07010               gui=bold
" hi Tag             guifg=#F92672               gui=italic
" hi Typedef         guifg=#66D9EF               "gui=bold
" hi Underlined      guifg=#808080               gui=underline
