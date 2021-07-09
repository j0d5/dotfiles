
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                             -- Lines of context
-- opt('o', 'shiftround', true)                          -- Round indent
-- opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('o', 'title', true)           -- Show filename
opt('o', 'switchbuf', 'useopen') -- reveal already opened files from the quickfix window instead of opening new buffers
opt('o', 'autochdir', true)        -- Automatically o.current directory to directory of last opened file
opt('o', 'magic', true)             -- Use magic escaping
opt('o', 'autoindent', true)       -- copy indent from current line
opt('o', 'formatoptions', 'qrn1')
-- opt('o', 'textwidth', 79)
-- opt('o', 'linebreak', true)
-- opt('o', 'sidescroll', 1)

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
