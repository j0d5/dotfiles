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

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- OPTIONS --
local indent = 4
cmd 'colorscheme sonokai'

opt('o', 'syntax', 'on')

opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'encoding', 'utf-8')     		      -- Use UTF-8 as the default buffer encoding
opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
opt('o', 'hidden', true)
opt('o', 'ignorecase', true)                          -- Ignore case
opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'number', true)                              -- Print line number
opt('w', 'relativenumber', false)                      -- Relative line numbers
opt('w', 'wrap', false)                               -- Disable line wrap
opt('o', 'title', true)           -- Show filename
opt('o', 'autoread', true)         -- Read open files again when changed outside Vim
opt('o', 'switchbuf', 'useopen') -- reveal already opened files from the quickfix window instead of opening new buffers
opt('o', 'autochdir', true)        -- Automatically o.current directory to directory of last opened file
opt('o', 'visualbell',  true)       -- o.visual bell instead of acustic
opt('o', 'matchtime', 4)       -- Jump to matching bracket for n/10 seconds
opt('o', 'spell', false)
opt('o', 'magic', true)             -- Use magic escaping
opt('o', 'backspace', 'indent,eol,start')
opt('o', 'autoindent', true)       -- copy indent from current line
opt('o', 'textwidth', 79)
opt('o', 'formatoptions', 'qrn1')
opt('o', 'linebreak', true)
opt('o', 'hlsearch', true)             -- Highlight search
opt('o', 'incsearch', true)            -- incremental searching
opt('o', 'showmatch', true)            -- When a bracket is inserted, briefly jump to a matching one
opt('o', 'sidescroll', 1)
g.mouse = 'a'           -- Enable the use of the mouse
g.mapleader = " "
-- o.completeopt='menu,menuone,longest,preview' -- Insert mode completion options
-- o.display+=lastline
-- nnoremap <tab> %
-- vnoremap <tab> %


-- {{{ Wildmenu
-- o.wildmenu                   -- Use menu to show command-line completion (in 'full' case)
-- - on first <Tab>, when more than one match, list all matches and complete the longest common string
-- - on second <Tab>, complete the next full match and show menu

-- Ignore these filenames during enhanced command line completion.
opt('o', 'wildignore', '*/.idea/*,*/.project/*')    -- ignore IDE project files
-- o.wildignore+=*/.git/*,*/.hg/*,*/.svn/* -- ignore version control files
-- o.wildignore+=*.aux,*.out,*.toc -- LaTeX intermediate files
-- o.wildignore+=*.jpg,*.bmp,*.gif -- binary images
-- o.wildignore+=*.luac            -- Lua byte code
-- o.wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.so,*.zip  -- compiled object files
-- o.wildignore+=*.pyc             -- Python byte code
-- o.wildignore+=*.spl             -- compiled spelling word lists
-- o.wildignore+=*.sw?             -- Vim swap files
-- o.wildignore+=.DS_Store         -- Mac files
-- o.wildignore+=*/tmp/*           -- MacOSX/Linux
-- o.wildignore+=*\\tmp\\*         -- Windows
-- }}}

-------------------- MAPPINGS ------------------------------
map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
map('n', '<Leader><Leader>', 'V')
map('i', 'jj', '<ESC>')

-- Package Management
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

-- {{{ Themes
paq{'tweetjay/vim-tweetjay'}
paq{'tomasr/molokai'}
paq{'sainnhe/sonokai'}
-- }}}

-- Git plugin - show changed lines in gutter
-- paq 'airblade/vim-gitgutter'
paq{'nvim-lua/plenary.nvim'}
paq{'lewis6991/gitsigns.nvim'}

-- {{{ Text handling
-- Automatic closing of quotes etc
paq{'Raimondi/delimitMate'}
-- Region expanding - use 'v' to visually mark regions
paq{'terryma/vim-expand-region'}

-- Nice highlighting of words
paq{'RRethy/vim-illuminate'}
-- }}}

paq{'junegunn/fzf', hook = fn['fzf#install']}
paq{'junegunn/fzf.vim'}
paq{'ojroques/nvim-lspfuzzy'}
-- {{{ Syntax checker and linter for vim
paq{'w0rp/ale'}
-- Autocompletion with LSP support
-- paq 'neoclide/coc.nvim', { 'branch': 'release' }
paq{'neovim/nvim-lspconfig'}
local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

-- For ccls we use the default settings
lsp.ccls.setup {}
-- root_dir is where the LSP server will start: here at the project root otherwise in current folder
lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- }}}

-- {{{ Syntax highlighting plugins
paq{'nvim-treesitter/nvim-treesitter'}  -- We recommend updating the parsers on update
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}
-- }}}

paq{'onsails/lspkind-nvim'}
paq{'kyazdani42/nvim-tree.lua'}
paq{'kyazdani42/nvim-web-devicons'}
paq{'akinsho/nvim-bufferline.lua'}
paq{'glepnir/galaxyline.nvim'}
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

-- {{( Angular
paq 'bdauria/angular-cli.vim'
paq 'burnettk/vim-angular'
paq 'matthewsimo/angular-vim-snippets'
paq 'claco/jasmine.vim'
paq 'iamcco/coc-angular'
-- }}}

paq 'ctrlpvim/ctrlp.vim'
paq 'editorconfig/editorconfig-vim'

-- {{{ File Management
-- Delete, Rename, Move, SudoEdit, SudoWrite
paq 'tpope/vim-eunuch'

-- Settings for backup edited files
paq 'tweetjay/vim-backstate'
-- }}}

