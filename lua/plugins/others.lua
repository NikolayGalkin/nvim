return {
  {
    'akinsho/toggleterm.nvim',
    opts = {
      hide_numbers = true,
      -- shade_terminals = false,
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
  {
    -- code screeenshot
    'mistricky/codesnap.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    build = 'make',
    enabled = false,
    opts = {
      mac_window_bar = true,
      title = 'CodeSnap.nvim',
      bg_theme = 'default', -- bamboo | sea | peach | grape | dusk | summer
      watermark = '',
    },
  },
  {
    'gbprod/yanky.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      ring = { history_length = 20 },
      highlight = { timer = 250 },
    },
    keys = {
      { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
      { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
      { '=p', '<Plug>(YankyPutAfterLinewise)', desc = 'Put yanked text in line below' },
      { '=P', '<Plug>(YankyPutBeforeLinewise)', desc = 'Put yanked text in line above' },
      { '[y', '<Plug>(YankyCycleForward)', desc = 'Cycle forward through yank history' },
      { ']y', '<Plug>(YankyCycleBackward)', desc = 'Cycle backward through yank history' },
    },
  },
}
