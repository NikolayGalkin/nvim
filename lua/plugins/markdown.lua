return {
  {
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
  },
  -- {
  --   -- FIX: fix icons for headers
  --   'lukas-reineke/headlines.nvim',
  --   event = { 'BufReadPre *.md', 'BufNewFile' },
  --   dependencies = 'nvim-treesitter/nvim-treesitter',
  --   opts = {
  --     -- markdown = {
  --     -- headline_highlights = {},
  --     -- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
  --     -- bullets = {},
  --     -- fat_headlines = false,
  --     -- codeblock_highlght = false,
  --     -- },
  --   },
  --   -- config = true, -- or `opts = {}`
  -- },
}
