return {
  {
    'williamboman/mason.nvim',
    cmd = { 'Mason' },
    -- lazy = true,
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    cmd = { 'MasonToolsUpdate' },
    -- lazy = true,
    opts = {
      run_on_start = true,
      auto_update = true,
      ensure_installed = {
        'stylua',
        'prettierd',
        'eslint_d',
      },
    },
    keys = {
      { '<leader>mtu', '<cmd>MasonToolsUpdate<CR>', desc = 'Mason Tool Update' },
      { 'hrsh7th/cmp-nvim-lsp' },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    opts = {
      ensure_installed = { 'lua_ls', 'tsserver' },
    },
  },
  {
    'neovim/nvim-lspconfig',
    event = 'BufRead',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
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

-- TODO: format on save
