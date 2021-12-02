-- {{{
-- Neovim plugin configuration
-- }}}

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- {{{ Package Management
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()

-- {{{ Themes
use { 'tweetjay/vim-tweetjay' }
use { 'tomasr/molokai' }
use { 'sainnhe/sonokai' }
-- }}}

-- {{{ Text handling
-- Region expanding - use 'v' to visually mark regions
use { 'terryma/vim-expand-region' }
-- Nice highlighting of words
use { 'RRethy/vim-illuminate' }
-- Color highlighting
use { 'norcalli/nvim-colorizer.lua' }
-- Icons
use { 'ryanoasis/vim-devicons' }
use { 'kyazdani42/nvim-web-devicons' }
-- Indentation guides for blank lines
use { 'lukas-reineke/indent-blankline.nvim', branch = 'master' }
-- Formatting
use { 'sbdchd/neoformat' }
-- }}}

-- {{{ File Management
use { 'kyazdani42/nvim-tree.lua' }
-- use { 'ctrlpvim/ctrlp.vim' }
-- use { 'junegunn/fzf', run = fn['fzf#install'] }
-- use { 'junegunn/fzf.vim' }
use { 'nvim-lua/popup.nvim' }
use { 'nvim-telescope/telescope.nvim' }
use { 'nvim-telescope/telescope-media-files.nvim' }
-- }}}

-- {{{ Syntax checker and linter
use { 'hrsh7th/vim-vsnip' }
-- Autocompletion with LSP support
use { 'neovim/nvim-lspconfig' }
use { 'hrsh7th/nvim-compe' }
use { 'dense-analysis/ale' }
use { 'onsails/lspkind-nvim' }
use { 'ojroques/nvim-lspfuzzy' } -- needed by fzf
-- }}}

-- {{{ Syntax highlighting
use { 'nvim-treesitter/nvim-treesitter' }  -- We recommend updating the parsers on update
-- }}}

-- {{{ Git
-- Show changed lines in gutter
use { 'nvim-lua/plenary.nvim' }
use { 'lewis6991/gitsigns.nvim' }
-- }}}

-- {{{ Status line
use { 'glepnir/galaxyline.nvim', branch = 'main' }
-- }}}

-- {{( Angular
use { 'bdauria/angular-cli.vim' }
use { 'burnettk/vim-angular' }
-- use { 'matthewsimo/angular-vim-snippets' }
use { 'claco/jasmine.vim' }
-- use { 'iamcco/coc-angular' }
-- }}}

use { 'editorconfig/editorconfig-vim' }

-- {{{ Settings for backup edited files
use { 'tweetjay/vim-backstate' }
-- }}}

use { 'windwp/nvim-autopairs' }
-- Treesitter based autoclosing
use {'windwp/nvim-ts-autotag' }
-- use { 'alvan/vim-closetag' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
