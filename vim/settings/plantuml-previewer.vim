" {{{ Plantuml Settings
augroup filetype_plantuml
    au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
        \  matchlist(system('grep plantuml.jar /usr/local/bin/plantuml'), '\v.* (\S+plantuml\.jar).*'),
        \  1,
        \  0
        \)

    autocmd FileType plantuml nnoremap <leader>m :make!<cr>
augroup END
" }}}
