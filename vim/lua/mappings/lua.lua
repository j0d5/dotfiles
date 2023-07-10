-- {{{
-- Keyboard mappings
-- }}}
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- {{{ General mappings
map('', '<leader>c', '"+y')         -- Copy to clipboard in normal, visual, select and operator modes
map('n', '<ESC><ESC>', ':nohl<CR>') -- Clear highlights
map('n', '<Leader><Leader>', 'V')   -- Select line on <leader><leader>
map('i', 'jj', '<ESC>')		        -- Map jj to Escape in input mode
map('n', '<Leader>b', ':b <C-d>')   -- Show buffers on <leader> b
map('n', 'j', 'gj')                 -- Also move through visual lines
map('n', 'k', 'gk')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- open terminals
-- map("n", "<C-b>" , [[<Cmd> vnew term://bash<CR>]] , opt) -- split term vertically , over the right
-- map("n", "<C-x>" , [[<Cmd> split term://bash | resize 10 <CR>]] , opt) -- split term vertically , over the right

-- map('n', '<Leader>o', ':CtrlP<CR>') -- Map <leader> o to CtrlP plugin
-- map('n', '<leader> -', "'.")

-- map('n', '<tab>', '%')
-- map('v', '<tab>', '%')

-- }}}

-- {{{ nvim-compe mappings
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completions()", {expr = true})
-- }}}

-- {{{ nvim-lspconfig mappings
local opts = {noremap = true, silent = true}
map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

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

-- {{{ nvimTree mappings
map( "n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- }}}

-- {{{ telescope
local opt = {noremap = true, silent = true}
map("n", "<Leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", opt)
map("n", "<Leader>fp", "<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>", opt)
map("n", "<Leader>fb", "<Cmd>lua require('telescope.builtin').buffers()<CR>", opt)
map("n", "<Leader>fh", "<Cmd>lua require('telescope.builtin').help_tags()<CR>", opt)
map("n", "<Leader>fo", "<Cmd>lua require('telescope.builtin').oldfiles()<CR>", opt)
map("n", "<Leader>fm", "<Cmd> Neoformat<CR>", opt)

-- map("n", "<C-a>", "<Cmd> %y+<CR>", opt)
-- }}}
