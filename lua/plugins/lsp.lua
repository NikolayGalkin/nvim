return {
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      auto_update = false,
      ensure_installed = {
        'stylua',
        'prettierd',
        'eslint_d',
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'lua_ls', 'tsserver' },
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lsp.tsserver.setup {
        capabilities = capabilities,
      }
      lsp.lua_ls.setup {
        capabilities = capabilities,
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      }

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end,
  },
}
