" Configure Ale {{{
" Fix files on save
let g:ale_fix_on_save = 1

" Lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" Use nice symbols for errors and warnings
let g:ale_sign_error = '❗️'
let g:ale_sign_warning = '❓'

" Fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
" }}}
