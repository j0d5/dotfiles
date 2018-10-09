"--------------------------------------------------------------------
" $Id: vimrc.header,v 0.2 2008/06/22 20:16:06 tmerkel Exp $
" Copyright 2008 Frubar Network (drscream@frubar.net)
"--------------------------------------------------------------------


" file header
function! FileHeading_Frubar()
	let s:line=line(".")
	call setline(s:line,"#--------------------------------------------------------------------")
	call append(s:line,"# $Id: ".expand("%:t").",v 0.1 ".strftime("%Y/%m/%d %T")." ".$USER." Exp $")
	call append(s:line+1,"# Copyright ".strftime("%Y")." Johannes Steudle (tweetjay2@icloud.com)")
	call append(s:line+2,"#--------------------------------------------------------------------")
	call append(s:line+3,"")
	unlet s:line
endfunction

" define the keymapping:
map ,hp <esc>mz:execute FileHeading_Frubar()<CR>`zjjjjA
