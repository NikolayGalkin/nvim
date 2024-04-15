return {
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
