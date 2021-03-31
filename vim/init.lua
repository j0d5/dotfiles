-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- a table to access global variables

-- load all plugins
require("pluginsList.lua")
require("web-devicons.lua")
-- set vim options
require("utils.lua")

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

require("mappings.lua")

cmd 'colorscheme sonokai' -- Set colorscheme

g.mouse = 'a'     -- Enable the use of the mouse
g.mapleader = " " -- Set leader to space

