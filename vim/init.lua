-- {{{
-- Neovim configuration
-- }}}
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

g.mapleader = " " -- Set leader to space
g.mouse = 'a'     -- Enable the use of the mouse
g.nocompatible = true
g.guifont = 'FiraCode Nerd Font 13'

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
