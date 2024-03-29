" Statusline
" :h mode() to see all modes
let g:currentmode={
    \ 'n'      : 'N ',
    \ 'no'     : 'N·Operator Pending ',
    \ 'v'      : 'V ',
    \ 'V'      : 'V·Line ',
    \ '\<C-V>' : 'V·Block ',
    \ 's'      : 'Select ',
    \ 'S'      : 'S·Line ',
    \ '\<C-S>' : 'S·Block ',
    \ 'i'      : 'I ',
    \ 'R'      : 'R ',
    \ 'Rv'     : 'V·Replace ',
    \ 'c'      : 'Command ',
    \ 'cv'     : 'Vim Ex ',
    \ 'ce'     : 'Ex ',
    \ 'r'      : 'Prompt ',
    \ 'rm'     : 'More ',
    \ 'r?'     : 'Confirm ',
    \ '!'      : 'Shell ',
    \ 't'      : 'Terminal '
    \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
    if (mode() =~# '\v(n|no)')
        exe 'hi! StatusLine ctermfg=008'
    elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
        exe 'hi! StatusLine ctermfg=005'
    elseif (mode() ==# 'i')
        exe 'hi! StatusLine ctermfg=004'
    else
        exe 'hi! StatusLine ctermfg=006'
    endif
    return ''
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return ''
    endif
endfunction

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%0*\ [%n]                                " buffernr
set statusline+=%0*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%0*\ %=                                  " Space
set statusline+=%3*\ %y\                                 " FileType
set statusline+=%0*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]  " Encoding + Fileformat
set statusline+=%0*\ %3p%%\ \ %l:%3c\                   " Rownumber/total (%)

hi User1 ctermfg=007 guifg=white guibg=darkgreen
hi User2 ctermfg=008 guifg=white guibg=blue
hi User3 ctermfg=008 guifg=white guibg=darkgrey
hi User4 ctermfg=008
hi User5 ctermfg=008
hi User7 ctermfg=008
hi User8 ctermfg=008
hi User9 ctermfg=007
