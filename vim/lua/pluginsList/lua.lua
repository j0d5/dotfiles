local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
cmd 'packadd paq-nvim'

-- {{{ Package Management
local paq = require('paq-nvim').paq
paq { 'savq/paq-nvim', opt=true}     -- Let Paq manage itself
-- }}}

-- {{{ Themes
paq { 'tweetjay/vim-tweetjay' }
paq { 'tomasr/molokai' }
paq { 'sainnhe/sonokai' }
-- }}}

-- {{{ Text handling
-- Region expanding - use 'v' to visually mark regions
paq { 'terryma/vim-expand-region' }
-- Nice highlighting of words
paq { 'RRethy/vim-illuminate' }
-- Color highlighting
paq { 'norcalli/nvim-colorizer.lua' }
-- Icons
paq { 'ryanoasis/vim-devicons' }
paq { 'kyazdani42/nvim-web-devicons' }
-- Indentation guides for blank lines
paq { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
-- Formatting
paq { 'sbdchd/neoformat' }
-- }}}

-- {{{ File Management
paq { 'kyazdani42/nvim-tree.lua' }
paq { 'akinsho/nvim-bufferline.lua' }
-- Delete, Rename, Move, SudoEdit, SudoWrite
paq { 'tpope/vim-eunuch' }
-- paq { 'ctrlpvim/ctrlp.vim' }
paq { 'junegunn/fzf', hook = fn['fzf#install'] }
paq { 'junegunn/fzf.vim' }
-- }}}

-- {{{ Syntax checker and linter
paq { 'hrsh7th/vim-vsnip' }
-- Autocompletion with LSP support
paq { 'neovim/nvim-lspconfig' }
paq { 'hrsh7th/nvim-compe' }
paq { 'dense-analysis/ale' }
paq { 'onsails/lspkind-nvim' }
paq { 'ojroques/nvim-lspfuzzy' }
-- }}}

-- {{{ Syntax highlighting
paq { 'nvim-treesitter/nvim-treesitter' }  -- We recommend updating the parsers on update
-- }}}

-- {{{ Git
-- Show changed lines in gutter
paq { 'nvim-lua/plenary.nvim' }
paq { 'lewis6991/gitsigns.nvim' }
-- }}}

-- {{{ Status line
paq { 'glepnir/galaxyline.nvim', branch = 'main' }
-- }}}

-- {{( Angular
paq { 'bdauria/angular-cli.vim' }
paq { 'burnettk/vim-angular' }
-- paq { 'matthewsimo/angular-vim-snippets' }
paq { 'claco/jasmine.vim' }
-- paq { 'iamcco/coc-angular' }
-- }}}

paq { 'editorconfig/editorconfig-vim' }

-- {{{ Settings for backup edited files
paq { 'tweetjay/vim-backstate' }
-- }}}

paq { 'windwp/nvim-autopairs' }
-- Treesitter based autoclosing
paq {'windwp/nvim-ts-autotag' }
-- paq { 'alvan/vim-closetag' }

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

-- paq { '907th/vim-auto-save' }
-- paq { 'chriskempson/base16-vim' }
-- paq { 'tweekmonster/startuptime.vim' }
paq { 'nvim-lua/popup.nvim' }
paq { 'nvim-telescope/telescope.nvim' }
paq { 'nvim-telescope/telescope-media-files.nvim' }

