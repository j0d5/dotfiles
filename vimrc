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
set history=1000     " keep 100 lines of command history
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
set tw=120           " Set line wrapping after 80 characters
set ch=2             " Make command line two lines high
set browsedir=current           " which directory to use for the file browser
set mouse=a          " enable the use of the mouse

" Create splits to the right (vertical) or to the bottom (horizontal)
set splitbelow
set splitright

if has('statusline')
  set laststatus=2   " Always show status line, even for one window
  " Broken down into easily includeable segments
  set statusline=%<%f\     " Filename
  set statusline+=%w%h%m%r " Options
  if has('fugitive')
    set statusline+=%{fugitive#statusline()} " Git Hotness
  endif
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
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
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.vim/.viminfo


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
  filetype off "disabled for Vundle

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
    autocmd BufReadPre,FileReadPre      *.asc,*.gpg set viminfo=
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
    "" Display line numbers
    autocmd FileType c,cpp,java,javascript,make,perl,python,slang set number

    "" For most programming languages except those where whitespace/tabs are
    "" important, use only tab characters for block indentation.
    "" Recommended coding convention: use tabs for the block indentation,
    "" then use spaces for any additional indentation that is internal to the
    "" block. That preserves code readability when using different tab stops.
    autocmd FileType c,cpp,java,javascript,perl,slang set noexpandtab shiftwidth=2 tabstop=2

    "" For C-like programming, have automatic indentation:
    autocmd FileType c,cpp,slang if has('cindent') | set cindent | endif

    "" For actual C (not C++) programming where comments have explicit end
    "" characters, if starting a new line in the middle of a comment, automatically
    "" insert the comment leader characters
    autocmd FileType c set formatoptions+=ro

    "" For Perl programming, have things in braces indenting themselves:
    autocmd FileType perl if has('smartindent') | set smartindent | endif

    "" For Python programming, expand tabs to 4 spaces
    "" since whitespace is important (4 spaces per indentation level)
    autocmd Filetype python set tabstop=4 shiftwidth=4 expandtab
    "" For Python programming, use cindent with the appropriate keywords
    autocmd Filetype python if has('cindent') && has('smartindent') | set cindent
          \ cinwords=class,def,elif,else,except,finally,for,if,try,while
          \ | endif

    "" In Makefiles, do not expand tabs to spaces, since actual tab characters
    "" are needed, and have indentation at 8 chars to be sure that all
    "" indents are tabs (despite the mappings later):
    autocmd FileType make set noexpandtab nosmarttab shiftwidth=4 tabstop=4

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
    "" For both CSS and HTML, display line numbers
    autocmd FileType css,html,xhtml set number

    "" For HTML, do not have Vim automatically add a <CR> or line break
    "" at the end of the last line if there isn't one, otherwise
    "" the default http headers will be sent
    autocmd FileType html,xhtml set binary noeol

    "" For both CSS and HTML, use genuine tab characters for
    "" indentation to make files a few bytes smaller:
    autocmd FileType css,html,xhtml set noexpandtab shiftwidth=2 tabstop=2

    "" For CSS, also have things in braces indented:
    autocmd Filetype css if has('smartindent') | set smartindent | endif

    "" For HTML, generally format text, but if a long line has been created,
    "" leave it alone when editing
    autocmd FileType html,xhtml set formatoptions+=tl

    "" Omnifunc completions
    autocmd FileType css if has('eval') || has('insert_expand') | set omnifunc=csscomplete#CompleteCSS | endif
    autocmd FileType html,xhtml if has('eval') || has('insert_expand') | set omnifunc=htmlcomplete#CompleteTags | endif
  augroup END

  augroup mail
    autocmd!
    autocmd Filetype mail if has('syntax') | set spell textwidth=70 wrap nonumber | endif
  augroup END

  "" Note: The autocommand event is defined to avoid setting this augroup when in the
  "" NERD tree buffer, which causes a conflict with its color settings.
  augroup highlightextrawhitespace
    autocmd!
    "" Highlight extra white space:
    autocmd Syntax *[^{nerdtree}]* highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    "" Show trailing whitepace and spaces before a tab:
    autocmd Syntax *[^{nerdtree}]* if has('syntax') | syntax match ExtraWhitespace /\s\+$\| \+\ze\t/ | endif
    "" Show tabs that are not at the start of a line:
    "autocmd Syntax *[^{nerdtree}]* syntax match ExtraWhitespace /[^\t]\zs\t\+/
    "" Show spaces used for indenting (so you use only tabs for indenting).
    "autocmd Syntax * syntax match ExtraWhitespace /^\t*\zs \+/
  augroup END

  " augroup includesyntaxindictionary
  "   autocmd!
  "   autocmd FileType * exe('setl dict+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim')
  " augroup END
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
function InsertTabWrapper()
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
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'Wutzara/vim-materialtheme'
Plugin 'vim-scripts/SmartusLine'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/powerline'
Plugin 'jcf/vim-latex'
Plugin 'plasticboy/vim-markdown'
Plugin 'gertjanreynaert/cobalt2-vim-theme'
Plugin 'naseer/logcat'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-surround.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-android/vim-adb-logcat'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


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

" --------------------
" TagList
" --------------------
" TagListTagName - Used for tag names
highlight MyTagListTagName gui=bold guifg=Black guibg=LightBlue
" TagListTagScope - Used for tag scope
highlight MyTagListTagScope gui=NONE guifg=Blue
" TagListTitle - Used for tag titles
highlight MyTagListTitle gui=bold guifg=Black guibg=LightGrey
" TagListComment - Used for comments
highlight MyTagListComment guifg=DarkGreen
" TagListFileName - Used for filenames
highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue
"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 0 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" let Tlist_Ctags_Cmd = 'ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
" very slow, so I disable this
" let Tlist_Process_File_Always = 1 " To use the :TlistShowTag and the :TlistShowPrototype commands without the taglist window and the taglist menu, you should set this variable to 1.
":TlistShowPrototype [filename] [linenumber]

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

let mapleader = "," " Change <Leader>
let maplocalleader = "," " Change <LocalLeader>

" map :w :up

" Save file with CTRL-s
noremap <C-S> :up<CR>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" quickly insert newline in normalmode without leaving
nnoremap <silent><A-o> o<Esc>k
nnoremap <silent><A-S-o> O<Esc>j

" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=

" map ,f to display all lines with keyword under cursor and ask which one
" to jump to
nnoremap <leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" open filename under cursor in a new window (use current file's working
" directory)
nnoremap gf :new %:p:h/<cfile><CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Change to hexmode with CTRL-h
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

nnoremap <silent><CR> :nohl<CR>

" switch to upper/lower window quickly
" map <C-J> <C-W>j
" map <C-K> <C-W>k

" map CTRL-L to piece-wise copying of the line above the current one
inoremap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s

" use <F6> to toggle line numbers
" nmap <silent> <F6> :set number!<CR>

" page down with <Space>
" nmap <Space> <PageDown>

noremap <F6> :GundoToggle<CR>

" --------------------
" Omni Completion
" --------------------
" set Ctrl+j in insert mode, like VS.Net
inoremap <C-Space> <C-x><C-o>

" --------------------
" TagList
" --------------------
" F5: Switch on/off TagList
nnoremap <silent> <F4> :TlistToggle<CR>
" set Ctrl+F12 to create ctags
noremap <C-F12> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" --------------------
" intelli sense extreme - omni first and then keyword completion
" --------------------
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
" \ "\<lt>C-n>" :
" \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
" \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
" \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" inoremap <C-@> <C-Space>

" --------------------
" NERDTree configuration
" --------------------
let NERDTreeWinSize=35                      " Increase window size to 35 columns
nnoremap <silent> <F3> :NERDTreeToggle<CR>      " map <F7> to toggle NERDTree window

" --------------------
" Project
" --------------------
noremap <A-S-p> :Project<CR>
" noremap <A-S-o> :Project<CR>:redraw<CR>/
nnoremap <silent> <F2> <Plug>ToggleProject
let g:proj_window_width = 30
let g:proj_window_increment = 50

" --------------------
" Function keymappings
" --------------------
vmap <leader>em :call ExtractMethod()<CR>

