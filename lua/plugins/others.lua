return {
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
    end,
    keys = {
      { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'ToggleTerm Float' },
      { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'ToggleTerm Bottom' },
    },
  },
}
