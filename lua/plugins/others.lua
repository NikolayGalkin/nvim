return {
  {
    'folke/twilight.nvim',
    event = { 'BufReadPre' },
    opts = {},
    keys = {
      { '<leader>tw', '<cmd>Twilight<cr>', desc = 'Twilight' },
    },
  },
  -- FIX: too many conflicts in mapping. Need to think )
  -- {
  --   'folke/flash.nvim',
  --   event = {
  --     'BufReadPre',
  --     'BufNewFile',
  --   },
  --   opts = {},
  -- },
  {
    'akinsho/toggleterm.nvim',
    opts = {
      hide_numbers = true,
      -- these two options will force the terminal to always be in insert mode
      start_in_insert = true,
      persist_mode = true,
      float_opts = {
        border = 'curved',
      },
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
      -- vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>')
      -- vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>')
    end,
    keys = {
      { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'ToggleTerm Float' },
      { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'ToggleTerm Bottom' },
    },
  },
}
