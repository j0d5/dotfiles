local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

local indent = 4

opt("o", "numberwidth", 2)

opt("o", "mouse", "a")

opt("w", "signcolumn", "yes")
opt("o", "cmdheight", 1)

opt("o", "updatetime", 250) -- update interval for gitsigns 
opt("o", "clipboard", "unnamedplus")

opt('o', 'syntax', 'on')

opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'encoding', 'utf-8')     		      -- Use UTF-8 as the default buffer encoding
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
-- opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
-- opt('o', 'completeopt', 'menuone,noselect') -- Insert mode completion options
-- opt('w', 'statusline', '2')
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

-- {{{ Wildmenu
-- o.wildmenu                   -- Use menu to show command-line completion (in 'full' case)
-- - on first <Tab>, when more than one match, list all matches and complete the longest common string
-- - on second <Tab>, complete the next full match and show menu

-- Ignore these filenames during enhanced command line completion.
-- opt('o', 'wildignore', '*/.idea/*,*/.project/*')    -- ignore IDE project files
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

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

return M
