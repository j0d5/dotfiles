vim.cmd [[packadd nvim-lspconfig]]
vim.cmd [[packadd nvim-compe]]

local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

-- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

lsp.bashls.setup {}
-- For ccls we use the default settings
lsp.ccls.setup {}
-- root_dir is where the LSP server will start: here at the project root otherwise in current folder
-- lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}
-- lsp.pyls.setup {}
lsp.pyright.setup {}
lspfuzzy.setup {} -- Make the LSP client use FZF instead of the quickfix list
lsp.angularls.setup {}
lsp.cssls.setup {}
lsp.html.setup {}
lsp.jsonls.setup {}
lsp.terraformls.setup {}
lsp.ts_ls.setup {}
lsp.vimls.setup {}
lsp.yamlls.setup {}
require'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            }
        }
    }
}
