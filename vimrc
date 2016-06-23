"#################################################
"# Maintainer:  Johannes Steudle                ##
"# Last change: 2012/01/30                      ##
"# .vimrc                                       ##
"#                                              ##
"#     for Unix and Mac OS X:  ~/.vimrc         ##
"#################################################


"#################################################
"#                                              ##
"# DEFAULT SET                                  ##
"#                                              ##
"#################################################
syntax on
set title            " Show filename
set showmode         " Show current mode
set showcmd          " Show command mode
set cursorline       " Highlight active line
set gdefault         " the /g flag on :s substitutions by default
set nocompatible     " Use Vim defaults (much better!)
set autoread         " read open files again when changed outside Vim
" set history=1000     " keep 100 lines of command history
set ruler            " Show the cursor position all the time
" set pastetoggle=<F2> " Toggle between paste mode on/off
set autoindent       " copy indent from current line
set smartindent      " Set indention
set shiftround       " shift to nearest indent
set shiftwidth=4     " Shift width
set tabstop=4        " Tab size
set expandtab        " Tabs to spaces
" set icon             " Icon text of the window
" set confirm          " Extra dialog
" set relativenumber
set number           " Line Numbers
set enc=utf-8        " Use UTF-8 as the default buffer encoding
set showmatch        " When a bracket is inserted, briefly jump to a matching one
set matchtime=4      " Jump to matching bracket for n/10 seconds
set scrolloff=3      " Scroll when cursor gets within 3 characters of top/bottom edge
set visualbell       " Set visual bell instead of acustic
"set noerrorbells
set magic            " Use magic escaping
set nrformats=octal,hex,alpha  " Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set backspace=indent,eol,start " Allow backspacing over everything
set completeopt=menu,menuone,longest,preview " Insert mode completion options
" Limit popup menu height
set pumheight=15
set hidden           " Allow switching edited buffers without saving
"set tw=120           " Set line wrapping after 80 characters
set textwidth=0 wrapmargin=0
set wrap
set ch=2             " Make command line two lines high
set browsedir=current           " which directory to use for the file browser
set mouse=a          " enable the use of the mouse
set nospell

" Create splits to the right (vertical) or to the bottom (horizontal)
set splitbelow
set splitright

" --------------------
" Shell
" --------------------
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif

" --------------------
" StatusLine
" --------------------
if has('statusline')
    set laststatus=2   " Always show status line, even for one window
    " Broken down into easily includeable segments
    " set statusline=%<%f\     " Filename
    " set statusline+=%w%h%m%r " Options
    " if has('fugitive')
    " set statusline+=%{fugitive#statusline()} " Git Hotness
    " endif
    " set statusline+=\ [%{&ff}/%Y]            " filetype
    " set statusline+=\ [%{getcwd()}]          " current dir
    " set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    " set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" --------------------
" SEARCH
" --------------------
set hlsearch             " Highlight search
set incsearch            " incremental searching
set ignorecase smartcase " Case-insensitive searching
" nnoremap  :nohlsearch/    " press enter to hide highlighting

" --------------------
" WILDMENU
" --------------------
set wildmenu                   " Use menu to show command-line completion (in 'full' case)
set wildmode=list:longest,full " set command-line completion mode:
" - on first <Tab>, when more than one match, list all matches and complete
" the longest common  string
" - on second <Tab>, complete the next full match and show menu

" Ignore these filenames during enhanced command line completion.
set wildignore+=*/.idea/*,*/.project/*    " ignore IDE project files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " ignore version control files
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif " binary images
set wildignore+=*.luac            " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
set wildignore+=*.pyc             " Python byte code
set wildignore+=*.spl             " compiled spelling word lists
set wildignore+=*.sw?             " Vim swap files
set wildignore+=.DS_Store         " Mac files

set thesaurus+=$HOME/.vim/thesaurus/mthesaur.txt

" --------------------
" BACKUP AND UNDO
" Directories are set in a function later
" --------------------
set updatecount=50   " Write swap file to disk after every 50 characters
set backup           " Enable Backups of the current edited file
set undofile				 " so is persistent undo ...
set undolevels=100   " maximum number of changes that can be undone
set undoreload=100   " maximum number lines to save for undo on a buffer reload
au BufWinLeave * silent! mkview   " make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview " make vim load view (state) (folds, cursor, etc)

" --------------------
" SAVE STATES
" --------------------
" Remember things between sessions
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :200  - remember 200 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:200,%,n~/.dotfiles/vim/viminfo


" Fix my <Backspace> key (in Mac OS X Terminal)
" set t_kb=
" fixdel

" Avoid loading MatchParen plugin
" let loaded_matchparen = 1


"#################################################
"#                                              ##
"# SPECIAL FILETYPES & ENCODING                 ##
"#                                              ##
"#################################################

if has('autocmd')
    "" Enable filetype detection
    filetype on "disabled for Vundle

    "" Load plugin files for specific file types
    filetype plugin on
    "" Load the indent file for specific file types
    filetype indent on

    autocmd BufEnter * cd %:p:h

    "" Transparent editing of gpg binary and ascii armor encrypted files.
    "" By Wouter Hanegraaff <wouter@blub.net>
    augroup encrypted
        autocmd!
        "" First make sure nothing is written to ~/.viminfo while editing
        "" an encrypted file.
        autocmd BufReadPre,FileReadPre      *.asc,*.gpg " set viminfo=
        "" We don't want a swap file, as it writes unencrypted data to disk
        autocmd BufReadPre,FileReadPre      *.asc,*.gpg set noswapfile
        "" Switch to binary mode to read the encrypted file
        autocmd BufReadPre,FileReadPre      *.asc,*.gpg set bin
        autocmd BufReadPre,FileReadPre      *.asc,*.gpg let ch_save = &ch|set ch=2
        autocmd BufReadPre,FileReadPre      *.asc,*.gpg let shsave=&sh
        autocmd BufReadPre,FileReadPre      *.asc,*.gpg let &sh='sh'
        autocmd BufReadPre,FileReadPre      *.asc,*.gpg let ch_save = &ch|set ch=2
        autocmd BufReadPost,FileReadPost    *.asc,*.gpg '[,']!gpg --decrypt --default-recipient-self 2> /dev/null
        autocmd BufReadPost,FileReadPost    *.asc,*.gpg let &sh=shsave
        "" Switch to normal mode for editing
        autocmd BufReadPost,FileReadPost    *.asc,*.gpg set nobin
        autocmd BufReadPost,FileReadPost    *.asc,*.gpg let &ch = ch_save|unlet ch_save
        autocmd BufReadPost,FileReadPost    *.asc,*.gpg execute ":doautocmd BufReadPost " . expand("%:r")
        "" Convert all text to encrypted text before writing
        autocmd BufWritePre,FileWritePre    *.asc,*.gpg set bin
        autocmd BufWritePre,FileWritePre    *.asc,*.gpg let shsave=&sh
        autocmd BufWritePre,FileWritePre    *.asc,*.gpg let &sh='sh'
        autocmd BufWritePre,FileWritePre    *.gpg '[,']!gpg --encrypt --default-recipient-self 2>/dev/null
        autocmd BufWritePre,FileWritePre    *.asc '[,']!gpg --armor --encrypt --default-recipient-self 2>/dev/null
        autocmd BufWritePre,FileWritePre    *.asc,*.gpg let &sh=shsave
        "" Undo the encryption so we are back in the normal text, directly
        "" after the file has been written.
        autocmd BufWritePost,FileWritePost  *.asc,*.gpg silent u
        autocmd BufWritePost,FileWritePost  *.asc,*.gpg set nobin
    augroup END

    augroup programming
        autocmd!

        "" For actual C (not C++) programming where comments have explicit end
        "" characters, if starting a new line in the middle of a comment, automatically
        "" insert the comment leader characters
        autocmd FileType c set formatoptions+=ro

        "" For Perl programming, have things in braces indenting themselves:
        autocmd FileType perl if has('smartindent') | set smartindent | endif

        "" For Python programming, use cindent with the appropriate keywords
        autocmd Filetype python if has('cindent') && has('smartindent') | set cindent
                    \ cinwords=class,def,elif,else,except,finally,for,if,try,while
                    \ | endif

        "" Omnifunc completions
        autocmd FileType c      if has('eval') || has('insert_expand') | set omnifunc=ccomplete#Complete | endif
        autocmd FileType javascript if has('eval') || has('insert_expand') | set omnifunc=javascriptcomplete#CompleteJS | endif
        autocmd FileType php    if has('eval') || has('insert_expand') | set omnifunc=phpcomplete#CompletePHP | endif
        autocmd FileType python if has('eval') || has('insert_expand') | set omnifunc=pythoncomplete#Complete | endif
        autocmd FileType ruby   if has('eval') || has('insert_expand') | set omnifunc=rubycomplete#Complete | endif
        autocmd FileType sql    if has('eval') || has('insert_expand') | set omnifunc=sqlcomplete#Complete | endif
        autocmd FileType xml    if has('eval') || has('insert_expand') | set omnifunc=xmlcomplete#CompleteTags | endif

        " ----------  qmake : set filetype for *.pro  ----------
        autocmd BufNewFile,BufRead *.pro  set filetype=qmake
    augroup END

    augroup web
        autocmd!
        "" For HTML, do not have Vim automatically add a <CR> or line break
        "" at the end of the last line if there isn't one, otherwise
        "" the default http headers will be sent
        autocmd FileType html,xhtml set binary noeol

        "" For CSS, also have things in braces indented:
        autocmd Filetype css if has('smartindent') | set smartindent | endif

        "" For HTML, generally format text, but if a long line has been created,
        "" leave it alone when editing
        autocmd FileType html,xhtml set formatoptions+=tl

        "" Omnifunc completions
        autocmd FileType css if has('eval') || has('insert_expand') | set omnifunc=csscomplete#CompleteCSS | endif
        autocmd FileType html,xhtml if has('eval') || has('insert_expand') | set omnifunc=htmlcomplete#CompleteTags | endif
    augroup END
endif

" --------------------
" ENCODING
" --------------------
" Always check for UTF-8 when trying to determine encodings
if &fileencodings !~? "utf-8"
    set fileencodings+=utf-8
endif

" Make sure we have a sane fallback for encoding detection
set fileencodings+=default


"#################################################
"#                                              ##
"# Functions                                    ##
"#                                              ##
"#################################################

" --------------------
" Tab Wrapper function
" --------------------
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '<leader>k'
        return "<leader><tab>"
    else
        return "<leader><c-p>"
    endif
endfunction

" --------------------
" Extract Method from visual marked code
" --------------------
function! ExtractMethod() range
    let name = inputdialog("Name of new method:")
    '<
    exe "normal! O\<BS>private " . name ."()\<CR>{\<Esc>"
    '>
    exe "normal! oreturn ;\<CR>}\<Esc>k"
    s/return/\/\/ return/ge
    normal! j%
    normal! kf(
    exe "normal! yyPi// = \<Esc>wdwA;\<Esc>"
    normal! ==
    normal! j0w
endfunction

" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function! ToggleHex()
    " hex mode should be considered a read-only operation
    " save values for modified and read-only for restoration later,
    " and clear the read-only flag for now
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
        " save old options
        let b:oldft=&ft
        let b:oldbin=&bin
        " set new options
        setlocal binary " make sure it overrides any textwidth, etc.
        let &ft="xxd"
        " set status
        let b:editHex=1
        " switch to hex editor
        %!xxd
    else
        " restore old options
        let &ft=b:oldft
        if !b:oldbin
            setlocal nobinary
        endif
        " set status
        let b:editHex=0
        " return to normal editing
        %!xxd -r
    endif
    " restore values for modified and read only state
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction

"###############################
"#                            ##
"# Create directories for vim ##
"#                            ##
"###############################
function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                \ 'backups': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swaps': 'directory',
                \ 'undos': 'undodir' }

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . '/' . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

"###########################
"#                        ##
"# PlugIn-Configuration   ##
"#                        ##
"###########################

filetype off "disabled for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.dotfiles/vim/vundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'jcf/vim-latex'
Plugin 'plasticboy/vim-markdown'
Plugin 'naseer/logcat'
Plugin 'vim-android/vim-adb-logcat'

" git related plugins
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" syntax checker for vim
Plugin 'scrooloose/syntastic'

" Add global syntax formatting config capability
Plugin 'editorconfig/editorconfig-vim'

" Add Solarized Theme
Plugin 'altercation/vim-colors-solarized'
Plugin 'Wutzara/vim-materialtheme'

" Little file manager
Plugin 'ctrlpvim/ctrlp.vim'
" Nice status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Completion plugins
Plugin 'ervandew/supertab'
" Just press enter for newline
Plugin 'dahu/Insertlessly'
" Region expanding
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-surround'

" Comment with gcc
Plugin 'tpope/vim-commentary.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" START Configure CTRL-P
set runtimepath^=~/.vim/vundle/ctrlp.vim
" set file filter for ctrl-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
" END CTRL-P

" START Configure Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" END Syntastic

" START configure markdown
let g:vim_markdown_folding_level = 6
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
"END markdown


" configure airline status bar
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''


" --------------------
" COLORSCHEME
" --------------------
colorscheme solarized
set background=dark
" colorscheme solarized
" set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h10


" load pathogen
" call pathogen#infect()

" netRW: Open files in a split window
let g:netrw_browse_split = 1

" --------------------
" SOURCE IMPORT
" Source vimrc.fix file, fix vim bugs
" --------------------
let VIM_FIX=expand("$BM_HOME/.vim/vimrc.fix")
if filereadable(VIM_FIX)
    exe "source " VIM_FIX
endif

" --------------------
" Set LaTeX environment
" --------------------
" let g:tex_indent_items = 1
" let g:Tex_SmartQuoteOpen = '"`'
" let g:Tex_SmartQuoteClose = "\"'"
" let Tex_ViewRuleComplete_pdf = '/usr/bin/open -a Skim $*.pdf'
if has('mac')
    " FIX: There's an issue with latex-suite finding the PDF viewer on Macs.
    let Tex_ViewRule_pdf = 'open $*.pdf'
endif
let g:tex_flavor='latex'
" let g:Tex_CompileRule_pdf
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,dvi'

" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"

"# Clang autocomplete
" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"#################################################
"#                                              ##
"#  Key mappings                                ##
"#                                              ##
"#################################################

let mapleader = "\<Space>" " Change <Leader>
" let maplocalleader = "," " Change <LocalLeader>

" press <Space>o to open a file
nnoremap <Leader>o :CtrlP<CR>

" press <Space>w to save file
nnoremap <Leader>w :w<CR>

" Jump to the END or BEGINNING of the file
nnoremap <CR> G
nnoremap <BS> gg

" Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Enter visual line mode with <Space><Space>:
nmap <Leader><Leader> V

" Hit v to select one character
" Hit v again to expand selection to word
" Hit v again to expand to paragraph
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Remove all highlightings
nnoremap <silent><ESC><ESC> :nohl<CR>

" quickly insert newline in normalmode without leaving
nnoremap <silent><M-o> o<Esc>k
nnoremap <silent><A-S-o> O<Esc>j

" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=

" map ,f to display all lines with keyword under cursor and ask which one
" to jump to
nnoremap <leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" open filename under cursor in a new window (use current file's working directory)
nnoremap gf :new %:p:h/<cfile><CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Change to hexmode with CTRL-h
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" switch to upper/lower window quickly
" map <C-J> <C-W>j
" map <C-K> <C-W>k

" map CTRL-L to piece-wise copying of the line above the current one
inoremap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s

" --------------------
" Function keymappings
" --------------------
vmap <leader>em :call ExtractMethod()<CR>

