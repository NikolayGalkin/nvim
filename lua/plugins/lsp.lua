return {
  -- {
  --   'williamboman/mason.nvim',
  --   cmd = { 'Mason' },
  --   -- lazy = true,
  --   opts = {},
  --   ui = {
  --     icons = {
  --       package_installed = '✓',
  --       package_pending = '➜',
  --       package_uninstalled = '✗',
  --     },
  --   },
  -- },
  -- {
  --   'WhoIsSethDaniel/mason-tool-installer.nvim',
  --   dependencies = {
  --     'williamboman/mason.nvim',
  --   },
  --   cmd = { 'MasonToolsUpdate' },
  --   -- lazy = true,
  --   opts = {
  --     run_on_start = true,
  --     auto_update = true,
  --     ensure_installed = {
  --       'luacheck',
  --       'stylua',
  --       'prettierd',
  --       'eslint_d',
  --       'vale',
  --     },
  --   },
  --   keys = {
  --     { '<leader>mtu', '<cmd>MasonToolsUpdate<CR>', desc = 'Mason Tool Update' },
  --     { 'hrsh7th/cmp-nvim-lsp' },
  --   },
  -- },
  -- {
  --   'williamboman/mason-lspconfig.nvim',
  --   lazy = true,
  --   opts = {
  --     ensure_installed = { 'lua_ls', 'tsserver' },
  --   },
  -- },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    config = function()
      local lsp = require 'lspconfig'
      local cmp_nvim_lsp = require 'cmp_nvim_lsp'

      local keymap = vim.keymap -- for conciseness
      local opts = { noremap = true, silent = true }

      local on_attach = function(_, bufnr)
        opts.buffer = bufnr

        opts.desc = 'Show LSP references'
        keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

        opts.desc = 'Go to declaration'
        keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = 'Show LSP definitions'
        keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions

        opts.desc = 'Show LSP implementations'
        keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

        opts.desc = 'See available code actions'
        keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = 'Show documentation for what is under cursor'
        keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = 'Restart LSP'
        keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      lsp.html.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lsp.tsserver.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lsp.cssls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lsp.tailwindcss.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lsp.emmet_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
      }

      lsp.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = {
                [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                [vim.fn.stdpath 'config' .. '/lua'] = true,
              },
            },
          },
        },
      }
    end,
  },
}
