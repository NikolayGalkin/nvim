return {
  {
    'nvimtools/none-ls.nvim',
    event = 'BufRead',
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd,
          -- null_ls.builtins.diagnostics.eslint_d,
        },
      }

      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end,
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        markdown = { 'markdownlint' },
      }
      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}

-- TODO: move to nvim-lint
-- TODO: move to conform
