require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    'jsonls',
    'markdown_oxide',
  },
})
