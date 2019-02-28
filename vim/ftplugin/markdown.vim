" Configure markdown {{{
" let g:vim_markdown_folding_level = 6
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2

let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'c',
    \ 'javascript',
    \ 'json',
    \ 'python',
    \ 'ruby',
    \ 'yaml',
    \ 'swift',
    \ 'objc'
\]

function! s:goyo_enter()
  Limelight
endfunction

function! s:goyo_leave()
  Limelight!
endfunction

augroup goyo_markdown
  "autocmd!
  autocmd! Filetype markdown,md,mkd call s:auto_goyo()
  " autocmd BufEnter *.md call s:auto_goyo()
  " autocmd BufNewFile,BufRead * call s:auto_goyo()
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

function! s:auto_goyo()
  echo 'Called auto_goyo'
  " if !exists('#goyo')
    echo 'Called Goyo'
    Goyo 80
  " elseif exists('#goyo')
    " echo 'Called Goyo!'
    " Goyo!
  " endif
endfunction
" }}}
