return {
  {
    'echasnovski/mini.basics',
    event = 'VeryLazy',
    opts = {
      options = {
        extra_ui = true,
        win_borders = 'rounded',
      },
      mappings = {
        windows = true,
      },
      silent = true,
    },
  },
  {
    'echasnovski/mini.animate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },
  {
    'echasnovski/mini.indentscope',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      symbol = '',
    },
  },
  {
    'echasnovski/mini.hipatterns',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
  {
    'echasnovski/mini.pairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'echasnovski/mini.comment',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },
  {
    'echasnovski/mini.jump2d',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      mappings = {
        start_jumping = '<leader><leader>',
      },
    },
  },
  {
    'echasnovski/mini.move',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },
  {
    'echasnovski/mini.cursorword',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },
  {
    'echasnovski/mini.bracketed',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },
  {

    'echasnovski/mini.bufremove',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
    keys = {
      {
        '<leader>x',
        function()
          require('mini.bufremove').delete(0, false)
        end,
        desc = 'Delete current buffer',
      },
    },
  },
}
