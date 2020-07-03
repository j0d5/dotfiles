" Git plugin - show changed lines in gutter
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'

" Syntax checker and linter for vim
Plug 'w0rp/ale'

" Syntax highlighting plugins
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'b4winckler/vim-objc', { 'for': 'objc' }
Plug 'aliva/vim-fish', { 'for': 'fish' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

" Haskell formatting and refactoring
Plug 'alx741/vim-hindent'
Plug 'mpickering/hlint-refactor-vim'

" Plugins for handling various formats
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'itspriddle/vim-marked', { 'for': 'markdown' }
Plug 'weirongxu/plantuml-previewer.vim', { 'for': 'plantuml' }
Plug 'tyru/open-browser.vim', { 'for': 'plantuml' }

" Add Theme
Plug 'tweetjay/vim-tweetjay'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

" Uncover usage problems in your writing
Plug 'reedes/vim-wordy', { 'for': 'markdown' }

" Buffer manager - open with <leader>b
Plug 'jeetsukumaran/vim-buffergator'

" Autocompletion
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Region expanding - use 'v' to visually mark regions
Plug 'terryma/vim-expand-region'

" Easier handling of multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Surround content with cs
Plug 'tpope/vim-surround'

" Nice highlighting of words
Plug 'RRethy/vim-illuminate'

" Viewer & Finder for LSP symbols and tags
Plug 'liuchengxu/vista.vim'

" Little file manager
Plug 'ctrlpvim/ctrlp.vim'
" Delete, Rename, Move, SudoEdit, SudoWrite
Plug 'tpope/vim-eunuch'

" Fuzzy file search
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Settings for backup edited files
Plug 'tweetjay/vim-backstate'
" mySPIN Syntax
Plug 'tweetjay/vim-tweetjay-syntax'
