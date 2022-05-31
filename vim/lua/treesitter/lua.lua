local ts = require 'nvim-treesitter.configs'

ts.setup {
  ensure_installed = 'all',
  ignore_install = { "phpdoc", "tree-sitter-phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    use_languagetree = true
  },
  indent = {
    enable = true
  }
}
