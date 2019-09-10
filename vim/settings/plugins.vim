" Git plugin - show changed lines in gutter
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Syntax checker and linter for vim
Plug 'w0rp/ale'

" Syntax highlighting plugins
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'b4winckler/vim-objc', { 'for': 'objc' }
Plug 'aliva/vim-fish', { 'for': 'fish' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

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
Plug 'chriskempson/base16-vim'

" Uncover usage problems in your writing
Plug 'reedes/vim-wordy', { 'for': 'markdown' }

" Buffer manager - open with <leader>b
Plug 'jeetsukumaran/vim-buffergator'

" Autocompletion
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Region expanding
Plug 'terryma/vim-expand-region'

" Easier handling of multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Surround content
Plug 'tpope/vim-surround'

" Use the fancy silver searcher
Plug 'rking/ag.vim'

" Nice highlighting of words
Plug 'RRethy/vim-illuminate'

Plug 'liuchengxu/vista.vim'

" Little file manager
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-eunuch'

" Fuzzy file search
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Settings for backup edited files
Plug 'tweetjay/vim-backstate'
