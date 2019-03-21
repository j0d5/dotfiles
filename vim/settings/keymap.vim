" Key mappings {{{
let mapleader = "\<Space>" " Change <Leader>
" let maplocalleader = "," " Change <LocalLeader>

" Use jj to escape
inoremap jj <ESC>

" Go to last edit location with leader + -
nnoremap <leader> - '.

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Map 'j' and 'k' also to virtual lines
nnoremap j gj
nnoremap k gk

" Window navigation with hjkl
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Cycle through buffers
nnoremap <C-Tab> :bn<cr>
nnoremap <C-S-Tab> :bp<cr>

" Change tab with Cmd + <number>
nnoremap <silent> <D-1> :tabn 1<cr>
nnoremap <silent> <D-2> :tabn 2<cr>
nnoremap <silent> <D-3> :tabn 3<cr>
nnoremap <silent> <D-4> :tabn 4<cr>
nnoremap <silent> <D-5> :tabn 5<cr>
nnoremap <silent> <D-6> :tabn 6<cr>
nnoremap <silent> <D-7> :tabn 7<cr>
nnoremap <silent> <D-8> :tabn 8<cr>
nnoremap <silent> <D-9> :tabn 9<cr>

" Map <leader> o to CtrlP plugin
nnoremap <Leader>o :CtrlP<CR>

" Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
" vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Enter visual line mode with <Space><Space>:
nmap <Leader><Leader> V

" 'v' select one character, 'v' again select word, 'v' again select paragraph
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Remove all highlightings
nnoremap <silent><ESC><ESC> :nohl<CR>

" Quickly insert newline in normalmode without leaving <Not working>
nnoremap <silent><A-o> o<Esc>k
nnoremap <silent><A-S-o> O<Esc>j

" Map ,f to display all lines with keyword under cursor and ask which one to jump to
nnoremap <leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

map <F3> :NERDTreeToggle<CR>
" }}}
