return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'prettierd',
        'stylua',
        'eslint_d',
        'markdownlint',
        'selene',
      },
    },
    keys = {
      { '<leader>mi', '<cmd>MasonToolsUpdate<cr>', desc = 'Mason Tool Update' },
    },
  },
  {
    'junnplus/lsp-setup.nvim',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    dependencies = {
      'neovim/nvim-lspconfig',
      'RRethy/vim-illuminate',
      'b0o/schemastore.nvim',
      { 'antosha417/nvim-lsp-file-operations', config = true },
      {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
          {
            'williamboman/mason.nvim',
            opts = {
              ui = {
                border = 'rounded',
                icons = {
                  package_installed = '✓',
                  package_pending = '➜',
                  package_uninstalled = '✗',
                },
              },
            },
          },
        },
        opts = {
          ensure_installed = {
            'tsserver',
            'html',
            'cssls',
            'jsonls',
            'yamlls',
            'tailwindcss',
            'lua_ls',
            'emmet_ls',
            'marksman',
          },
        },
      },
    },
    config = function()
      local signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰌶 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      require('lsp-setup').setup {
        default_mappings = true,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        on_attach = function(client)
          require('illuminate').on_attach(client)
        end,

        inlay_hints = {
          enabled = false,
          highlight = 'Comment',
        },
        servers = {
          html = {},
          cssls = {},
          marksman = {},
          tailwindcss = {},
          tsserver = {
            -- detached = false,
          },
          emmet_ls = {
            filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
          },
          jsonls = {
            settings = {
              json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
              },
            },
          },
          yamlls = {
            settings = {
              yaml = {
                schemaStore = {
                  enable = false,
                  url = '',
                },
                schemas = require('schemastore').yaml.schemas(),
              },
            },
          },
          lua_ls = {
            settings = {
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
          },
        },
      }
    end,
  },
}
