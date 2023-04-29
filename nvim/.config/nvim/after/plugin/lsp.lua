local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  -- Allow treesitter highlighting to take higher priority (100)
  -- https://github.com/neovim/neovim/pull/22981
  vim.highlight.priorities.semantic_tokens = 95
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
