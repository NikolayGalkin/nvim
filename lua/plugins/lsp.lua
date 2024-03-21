local lsp_keymaps = function(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  keymap(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  keymap(bufnr, 'n', '<leader>li', '<cmd>LspInfo<cr>', opts)
  keymap(bufnr, 'n', '<leader>lI', '<cmd>LspInstallInfo<cr>', opts)
  keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  -- keymap(bufnr, 'n', '<leader>lj', '<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>', opts)
  -- keymap(bufnr, 'n', '<leader>lk', '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>', opts)
  -- keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  -- keymap(bufnr, 'n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)
end

local on_attach = function(client, bufnr)
  local illuminate = require 'illuminate'

  if client.name == 'tsserver' then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.name == 'lua_ls' then
    client.server_capabilities.documentFormattingProvider = false
  end

  lsp_keymaps(bufnr)
  illuminate.on_attach(client)
end

local get_capabilities = function()
  local cmp_nvim_lsp = require 'cmp_nvim_lsp'
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  return capabilities
end

return {
  'neovim/nvim-lspconfig',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'antosha417/nvim-lsp-file-operations',
    'RRethy/vim-illuminate',
    'williamboman/mason.nvim',
    'b0o/schemastore.nvim',
    { 'ray-x/lsp_signature.nvim', opts = {} },
  },
  config = function()
    local lsp = require 'lspconfig'

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    local config = {
      virtual_text = true, -- disable virtual text
      signs = {
        active = signs, -- show signs
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    }
    vim.diagnostic.config(config)

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'rounded',
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = 'rounded',
    })

    local capabilities = get_capabilities()

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

    lsp.jsonls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    }
    lsp.yamlls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        yaml = {
          schemaStore = {
            enable = false,
            url = '',
          },
          schemas = require('schemastore').yaml.schemas(),
        },
      },
    }

    lsp.emmet_ls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
    }

    lsp.marksman.setup {
      capabilities = capabilities,
      on_attach = on_attach,
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
}
