local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- open terminals  
-- map("n", "<C-b>" , [[<Cmd> vnew term://bash<CR>]] , opt) -- split term vertically , over the right  
-- map("n", "<C-x>" , [[<Cmd> split term://bash | resize 10 <CR>]] , opt) -- split term vertically , over the right  

map('', '<leader>c', '"+y')         -- Copy to clipboard in normal, visual, select and operator modes
map('n', '<ESC><ESC>', ':nohl<CR>')   -- Clear highlights
map('n', '<Leader><Leader>', 'V')   -- Select line on <leader><leader>
map('i', 'jj', '<ESC>')		    -- Map jj to Escape in input mode
map('n', '<Leader>b', ':b <C-d>')   -- Show buffers on <leader> b
map('n', '<Leader>o', ':CtrlP<CR>') -- Map <leader> o to CtrlP plugin
map('n', '<leader> -', "'.")
map('n', 'j', 'gj')                 -- Also move through visual lines
map('n', 'k', 'gk')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<tab>', '%')
map('v', '<tab>', '%')

map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

