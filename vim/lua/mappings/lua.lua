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

-------------------- MAPPINGS ------------------------------
map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
map('n', '<Leader><Leader>', 'V')
map('i', 'jj', '<ESC>')
map('n', '<Leader>b', ':b <C-d>')
-- Map <leader> o to CtrlP plugin
map('n', '<Leader>o', ':CtrlP<CR>')

map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

map('i', '<silent><expr> <C-Space>', 'compe#complete()')
map('i', '<silent><expr> <CR>', 'compe#confirm({ "keys": "<Plug>delimitMateCR", "mode": "" })')
map('i', '<silent><expr> <C-e>', 'compe#close("<C-e>")')
map('i', '<silent><expr> <C-f>', 'compe#scroll({ "delta": +4 })')
map('i', '<silent><expr> <C-d>', 'compe#scroll({ "delta": -4 })')

map('n', '%', '<tab>')
map('v', '%', '<tab>')

