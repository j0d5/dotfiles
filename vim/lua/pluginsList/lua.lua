local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
cmd 'packadd paq-nvim'

-- Package Management
local paq = require('paq-nvim').paq
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

-- {{{ Themes
paq{'tweetjay/vim-tweetjay'}
paq{'tomasr/molokai'}
paq{'sainnhe/sonokai'}
-- }}}

-- Git plugin - show changed lines in gutter
paq{'nvim-lua/plenary.nvim'}
paq{'lewis6991/gitsigns.nvim'}

-- {{{ Text handling
-- Automatic closing of quotes etc
paq{'Raimondi/delimitMate'}
-- Region expanding - use 'v' to visually mark regions
paq{'terryma/vim-expand-region'}

-- Nice highlighting of words
paq{'RRethy/vim-illuminate'}
-- Color highlighting
paq {"norcalli/nvim-colorizer.lua"}
paq {"ryanoasis/vim-devicons"}
-- }}}

-- {{{ Syntax checker and linter for vim
paq{'w0rp/ale'}
-- Autocompletion with LSP support
-- paq 'neoclide/coc.nvim', { 'branch': 'release' }
paq{'neovim/nvim-lspconfig'}
paq {"hrsh7th/nvim-compe"}

-- {{{ Syntax highlighting plugins
paq{'nvim-treesitter/nvim-treesitter'}  -- We recommend updating the parsers on update
-- }}}

paq{'onsails/lspkind-nvim'}
paq{'kyazdani42/nvim-web-devicons'}
paq{'glepnir/galaxyline.nvim', branch = 'main'}

-- {{( Angular
paq 'bdauria/angular-cli.vim'
paq 'burnettk/vim-angular'
paq 'matthewsimo/angular-vim-snippets'
paq 'claco/jasmine.vim'
paq 'iamcco/coc-angular'
-- }}}

paq 'editorconfig/editorconfig-vim'

-- {{{ File Management
paq{'kyazdani42/nvim-tree.lua'}
paq{'akinsho/nvim-bufferline.lua'}
-- Delete, Rename, Move, SudoEdit, SudoWrite
paq 'tpope/vim-eunuch'
paq 'ctrlpvim/ctrlp.vim'
paq{'junegunn/fzf', hook = fn['fzf#install']}
paq{'junegunn/fzf.vim'}
paq{'ojroques/nvim-lspfuzzy'}
-- }}}

-- {{{ Settings for backup edited files
paq 'tweetjay/vim-backstate'
-- }}}

-- {{{ Markdown Stuff
-- paq 'plasticboy/vim-markdown', { 'for': 'markdown' }
-- paq 'itspriddle/vim-marked', { 'for': 'markdown' }
-- Uncover usage problems in your writing
-- paq 'reedes/vim-wordy', { 'for': 'markdown' }
-- }}}

-- {{{ Plantuml Stuff
-- paq 'aklt/plantuml-syntax', { 'for': 'plantuml' }
-- paq 'weirongxu/plantuml-previewer.vim', { 'for': 'plantuml' }
-- paq 'tyru/open-browser.vim', { 'for': 'plantuml' }
-- }}}

-- paq {"nvim-lua/plenary.nvim"}
-- paq {"907th/vim-auto-save"}
-- paq {"chriskempson/base16-vim"}
-- paq {"sbdchd/neoformat"}
paq {"windwp/nvim-autopairs"}
-- paq {"alvan/vim-closetag"}
-- paq {"tweekmonster/startuptime.vim"}
-- paq {"nvim-telescope/telescope.nvim"}
-- paq {"nvim-telescope/telescope-media-files.nvim"}
-- paq {"nvim-lua/popup.nvim"}
-- paq {"lukas-reineke/indent-blankline.nvim", branch = 'lua'}

