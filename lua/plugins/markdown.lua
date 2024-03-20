return {
  'iamcco/markdown-preview.nvim',
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    { '<leader>mt', '<cmd>MarkdownPreviewToggle<cr>' },
    { '<leader>mp', '<cmd>MarkdownPreview<cr>' },
    { '<leader>ms', '<cmd>MarkdownPreviewStop<cr>' },
  },
}
