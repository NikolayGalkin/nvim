return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        'tsserver',
        'html',
        'cssls',
        'tailwindcss',
        'lua_ls',
        'emmet_ls',
      },
      -- auto-install configured servers (with lspconfig)
      -- automatic_installation = true, -- not the same as ensure_installed
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'eslint_d', -- js linter
        'markdownlint',
      },
      keys = {
        { '<leader>mtu', '<cmd>MasonToolsUpdate<CR>', desc = 'Mason Tool Update' },
      },
    }
  end,
}
-- local Mason = {
--   'williamboman/mason.nvim',
--   cmd = { 'Mason' },
--   opts = {
--     ui = {
--       border = 'rounded',
--     },
--   },
-- }
--
-- local MasonToolInstaller = {
--   'WhoIsSethDaniel/mason-tool-installer.nvim',
--   dependencies = {
--     Mason,
--   },
--   cmd = { 'MasonToolsUpdate' },
--   opts = {
--     run_on_start = true,
--     auto_update = true,
--     ensure_installed = {
--       'stylua',
--       'prettierd',
--       'eslint_d',
--       'markdownlint',
--     },
--   },
--   keys = {
--     { '<leader>mtu', '<cmd>MasonToolsUpdate<CR>', desc = 'Mason Tool Update' },
--   },
-- }
--
-- local MasonLSPConfig = {
--   'williamboman/mason-lspconfig.nvim',
--   lazy = true,
--   dependencies = {
--     Mason,
--   },
--   opts = {
--     ensure_installed = {
--       'lua_ls',
--       'cssls',
--       'html',
--       'tsserver',
--       'bashls',
--       'jsonls',
--     },
--   },
-- }
--
-- return {
--   MasonToolInstaller,
--   MasonLSPConfig,
-- }
