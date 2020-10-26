" {{{ Themes
Plug 'tweetjay/vim-tweetjay'
Plug 'tomasr/molokai'
" }}}

" Git plugin - show changed lines in gutter
Plug 'airblade/vim-gitgutter'

" {{{ Text handling
" Automatic closing of quotes etc
Plug 'Raimondi/delimitMate'
" Region expanding - use 'v' to visually mark regions
Plug 'terryma/vim-expand-region'

" Easier handling of multiple cursors
" Plug 'terryma/vim-multiple-cursors'

" Surround content with cs
" Plug 'tpope/vim-surround'

" Nice highlighting of words
Plug 'RRethy/vim-illuminate'
" }}}

" {{{ Syntax checker and linter for vim
Plug 'w0rp/ale'
" Autocompletion with LSP support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" }}}

" {{{ Syntax highlighting plugins
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'b4winckler/vim-objc', { 'for': 'objc' }
Plug 'aliva/vim-fish', { 'for': 'fish' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'martinda/Jenkinsfile-vim-syntax', { 'for': 'groovy' }
" }}}

" {{{ Flutter Stuff
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'natebosch/vim-lsc', { 'for': 'dart' }
Plug 'natebosch/vim-lsc-dart', { 'for': 'dart' }
" }}}

" {{{ Haskell Stuff
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Plug 'alx741/vim-hindent'
" }}}

" {{{ Markdown Stuff
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'itspriddle/vim-marked', { 'for': 'markdown' }
" Uncover usage problems in your writing
Plug 'reedes/vim-wordy', { 'for': 'markdown' }
" }}}

" {{{ Plantuml Stuff
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
Plug 'weirongxu/plantuml-previewer.vim', { 'for': 'plantuml' }
Plug 'tyru/open-browser.vim', { 'for': 'plantuml' }
" }}}

" {{( Angular
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'leafgarland/typescript-vim'
Plug 'bdauria/angular-cli.vim'
Plug 'burnettk/vim-angular'
Plug 'matthewsimo/angular-vim-snippets'
Plug 'claco/jasmine.vim'
Plug 'iamcco/coc-angular'
" }}}

Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'

" {{{ File Management
" Delete, Rename, Move, SudoEdit, SudoWrite
Plug 'tpope/vim-eunuch'

" Settings for backup edited files
Plug 'tweetjay/vim-backstate'
" }}}
