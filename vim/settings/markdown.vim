" {{{ Markdown Settings
" Disable the auto folding
let g:vim_markdown_folding_disabled = 1
" Don't insert new spaces if a new line is added
let g:vim_markdown_new_list_item_indent = 0

augroup filetype_markdown
    autocmd FileType markdown nnoremap <leader>m :MarkedOpen<cr>
augroup END
" }}}
