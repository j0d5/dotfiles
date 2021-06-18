-- {{{
-- Neovim configuration
-- }}}
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- a table to access global variables

g.mapleader = " " -- Set leader to space
g.mouse = 'a'     -- Enable the use of the mouse
g.nocompatible = true

-- load all plugins
require("pluginsList.lua")
require("web-devicons.lua")
-- set vim options
require("utils.lua")
require("mappings.lua")

-- set options for file tree
require("nvimTree.lua")
require("bufferline.lua")
require("statusline.lua")
require("telescope-nvim.lua")

require("gitsigns.lua")
require("colorizer").setup()

-- setup lsp
require("nvim-lspconfig.lua")
require("nvim-compe.lua")

require("treesitter.lua")

require('nvim-autopairs').setup()
require('nvim-ts-autotag').setup()

cmd 'colorscheme sonokai' -- Set colorscheme

