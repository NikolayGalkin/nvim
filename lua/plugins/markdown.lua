local markview = {
  'OXY2DEV/markview.nvim',
  ft = { 'markdown' },
  dependencies = {
    'Kicamon/markdown-table-mode.nvim',
    'nvim-tree/nvim-web-devicons', -- Used by the code bloxks
  },
  config = true,
  -- config = function()
  --   require('markview').setup()
  -- end,
}

local markdown = {
  'MeanderingProgrammer/markdown.nvim',
  ft = { 'markdown' },
  name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  -- opts = function(_, opts)
  --   return vim.tbl_extend('force', opts, {
  --     bullets = { '● ', '○ ', '◆ ', '◇ ' },
  --   })
  -- end,
  config = function()
    require('render-markdown').setup {}
    require('snippets.notes').setup()
  end,
}

local preview = {
  'iamcco/markdown-preview.nvim',
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    { '<leader>mp', '<cmd>MarkdownPreview<cr>', desc = 'Markdown Preview' },
    { '<leader>mt', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview Toggle' },
    { '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', desc = 'Markdown Preview Stop' },
  },
}

return {
  markview,
  preview,
}
