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
  -- {
  --   'echasnovski/mini.hipatterns',
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   dependencies = {
  --     { 'echasnovski/mini.extra' },
  --   },
  --   config = function()
  --     local hp = require 'mini.hipatterns'
  --     local hw = require('mini.extra').gen_highlighter.words
  --
  --     hp.setup {
  --       highlighters = {
  --         todo = hw({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
  --         fixme = hw({ 'FIXME', 'FIX', 'fix', 'Fix' }, 'MiniHipatternsFixme'),
  --       },
  --       hex_color = hp.gen_highlighter.hex_color(),
  --     }
  --   end,
  -- },
  {
    'echasnovski/mini.pairs',
    event = 'InsertEnter',
    config = true,
  },
  -- Can't comment tsx
  {
    'echasnovski/mini.comment',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = function()
      return {
        options = {
          custom_commentstring = function()
            return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
          end,
        },
      }
    end,
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
  {
    'echasnovski/mini.surround',
    event = 'InsertEnter',
    config = true,
  },
}
