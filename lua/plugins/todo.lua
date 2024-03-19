return {
  'folke/todo-comments.nvim',
  event = 'Bufread',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  keys = {
    { '<leader>td', ':TodoTelescope<CR>', desc = 'Todo Telescope' },
  },
}
