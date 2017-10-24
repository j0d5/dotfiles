"#################################################
"# Maintainer:  Johannes Steudle                ##
"# Last change: 2016/06/29                      ##
"# .gvimrc                                      ##
"#                                              ##
"#     for Unix and Mac OS:  ~/.gvimrc          ##
"#################################################


" --------------------
" Make external commands work through a pipe instead of a pseudo-tty
" --------------------
" set noguipty
" set macmeta

" --------------------
"set the X11 font to use
" --------------------
if has("gui_gtk2")
  set guifont=Inconsolata\ 12
elseif has("gui_macvim")
  " set guifont=Monospace\ 16
  set guifont=Inconsolata:h15
  " set guifont=Menlo\ Regular:h13
  set guiheadroom=0
elseif has("gui_win32")
  set guifont=Consolas:h11:cANSI
endif

set lines=70
set columns=130
set mousehide      " Hide the mouse when typing text
set guioptions=aAci " no toolbar, menubar, scrollbar
" set linespace=1.5
" set relativenumber
" set tabpagemax=15
" set transparency=8
" colorscheme johannes

" Make shift-insert work like in Xterm
map! <S-Insert> <MiddleMouse>

" I like highlighting strings inside C comments
let c_comment_strings=1

" --------------------
" SPELLCHECKING
" --------------------
fun SetSpellCheck()
  set spell spelllang=en,de		    " Spell checking language
  set spell spellsuggest=double,10	" Description of the spell-checker
									" zg to add word to word list
									" zw to reverse
									" zug to remove word from word list
									" z= to get list of possibilities
endfun

" --------------------
" ShowMarks
" --------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Don't leave on by default, use :ShowMarksOn to enable
let g:showmarks_enable = 0
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen

