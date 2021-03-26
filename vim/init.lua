-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  if scopes[scope] == nil then
    print(key)
  end

  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- load all plugins
require("pluginsList.lua")
require("web-devicons.lua")

require("utils.lua")
require("nvimTree.lua")
require("bufferline.lua")
require("statusline.lua")
-- require("telescope-nvim.lua")

require("gitsigns.lua")
require "colorizer".setup()

-- lsp
require("nvim-lspconfig.lua")
require("nvim-compe.lua")

require("treesitter.lua")
require("mappings.lua")

-- OPTIONS --
cmd 'colorscheme sonokai'

g.mouse = 'a'           -- Enable the use of the mouse
g.mapleader = " "
-- o.display+=lastline
-- nnoremap <tab> %
-- vnoremap <tab> %


