return {
  {
    'williamboman/mason.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'Mason' },
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    opts = {
      mason = {
        ui = {
          border = 'rounded',
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      },
      lspconfig = {
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
      mti = {
        ensure_installed = {
          'prettierd',
          'stylua',
          'eslint_d',
          'markdownlint',
          'selene',
          'yamllint',
          'xmlformatter',
        },
      },
    },
    config = function(_, opts)
      require('mason').setup(opts.mason)
      require('mason-lspconfig').setup(opts.lspconfig)
      require('mason-tool-installer').setup(opts.mti)

      vim.keymap.set('n', '<leader>mi', '<cmd>MasonToolsUpdate<cr>', { desc = 'Mason Tool Update' })
    end,
  },
  {
    'junnplus/lsp-setup.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'b0o/schemastore.nvim',
      { 'antosha417/nvim-lsp-file-operations', config = true },
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
          enabled = true,
        },
        servers = {
          html = {},
          cssls = {
            settings = {
              css = {
                lint = {
                  unknownAtRules = 'ignore',
                },
              },
            },
          },
          marksman = {},
          tailwindcss = {},
          tsserver = {
            single_file_support = false,
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = 'all',
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayVariableTypeHints = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
          },
          emmet_ls = {
            filetypes = {
              'html',
              'typescriptreact',
              'javascriptreact',
              'css',
              'sass',
              'scss',
              'less',
            },
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
                hint = {
                  enable = true,
                  setType = true,
                },
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
