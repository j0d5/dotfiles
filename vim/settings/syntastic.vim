" Configure Syntastic {{{
if has('syntastic')
    " set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    " set statusline+=%*

    " Mark syntax errors with :signs
    let g:syntastic_enable_signs=1
    let g:syntastic_always_populate_loc_list = 1
    " Show the error list automatically
    let g:syntastic_auto_loc_list = 1
    " let g:syntastic_check_on_open = 1
    " let g:syntastic_check_on_wq = 0

    let g:syntastic_swift_swiftlint_use_defaults = 1
    let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
endif
" }}}
