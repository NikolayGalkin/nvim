local formatting = {
  'stevearc/conform.nvim',
  event = { 'LspAttach', 'BufWritePre' },
  opts = {
    formatters_by_ft = {
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      json = { 'prettierd' },
      yaml = { 'prettierd' },
      graphql = { 'prettierd' },
      markdown = { 'prettierd', 'markdownlint' },
      lua = { 'stylua' },
      xml = { 'xmlformatter' },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },
  },
  config = function(_, opts)
    local conform = require 'conform'

    conform.setup(opts)

    vim.keymap.set({ 'n', 'v' }, '<leader>gf', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}

local linting = {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      markdown = { 'markdownlint' },
      typescriptreact = { 'eslint_d' },
      lua = { 'selene' },
      yaml = { 'yamllint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>l', lint.try_lint, { desc = 'Trigger linting for current file' })
  end,
}

-- local commenting = {
--   'numToStr/Comment.nvim',
--   config = true,
-- }

local inout = {
  'ysmb-wtsg/in-and-out.nvim',
  event = { 'BufReadPre', 'BufNewFile' },

  config = function()
    vim.keymap.set('i', '<C-CR>', function()
      require('in-and-out').in_and_out()
    end)
  end,
}

return {
  linting,
  formatting,
  -- commenting,
  inout,
}
