" Configure Ale {{{

" Lint after 1000ms after changes are made both on insert mode and normal mode
" let g:ale_lint_on_text_changed = 'always'
" let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed        = 'never'
let g:ale_lint_on_enter               = 0
let g:ale_lint_on_save                = 1

" Fix files on save
let g:ale_fix_on_save = 0

" Use nice symbols for errors and warnings
let g:ale_sign_error = '❗️'
let g:ale_sign_warning = '❓'

" let g:ale_linters = {
" \   'markdown':      ['mdl', 'writegood'],
" \}

" Fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'markdown': ['prettier', 'textlint'],
\}

" }}}
