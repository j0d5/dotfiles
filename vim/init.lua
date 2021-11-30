-- {{{
-- Neovim configuration
-- }}}
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- General settings
g.nocompatible = true
g.number = true                         -- Print line number
g.cursorline = true
g.expandtab = true                      -- Use spaces instead of tabs
g.hlsearch = true                       -- Highlight search
g.visualbell = true                     -- o.visual bell instead of acustic
g.tabstop = 4                           -- Number of spaces tabs count for
g.shiftwidth = 4                        -- Size of an indent
g.syntax = 'on'

g.mapleader = " "                       -- Set leader to space
g.mouse = 'a'                           -- Enable the use of the mouse
g.guifont = 'FiraCode Nerd Font 13'
g.incsearch = true                      -- incremental searching

g.encoding = 'utf-8'                    -- Use UTF-8 as the default buffer encoding
g.smartcase = true                      -- Don't ignore case with capitals
g.smartindent = true                    -- Insert indents automatically
g.ignorecase = true                     -- Ignore case
g.clipboard = 'unnamedplus'
g.hidden = true                         -- ensure hidden buffers that have unsaved changes aren't lost when closing vim
g.wrap = false                          -- Disable line wrap
g.backspace = 'indent,eol,start'
g.autoread = true                       -- Read open files again when changed outside Vim
g.splitbelow = true                     -- Put new windows below current
g.splitright = true                     -- Put new windows right of current
g.showmatch = true                      -- When a bracket is inserted, briefly jump to a matching one
g.spell = false
opt.termguicolors = true                  -- True color support
g.grepprg='ag --nogroup --nocolor --skip-vcs-ignores'

-- load all plugins
require("pluginsList.lua")
require("web-devicons.lua")
-- set vim options
require("utils.lua")
require("mappings.lua")

-- set options for file tree
require("nvimTree.lua")
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
