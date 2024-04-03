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
    config = function(_, opts)
      vim.wo.relativenumber = true
      vim.cmd 'set expandtab'
      vim.cmd 'set tabstop=2'
      vim.cmd 'set softtabstop=2'
      vim.cmd 'set shiftwidth=2'

      vim.opt.swapfile = false
      vim.opt.termguicolors = true
      vim.opt.clipboard:append 'unnamedplus'
      vim.opt.cursorline = true
      vim.opt.colorcolumn = { 120 }

      vim.g.loaded_perl_provider = 0
      vim.g.loaded_ruby_provider = 0
      -- vim.opt.scrolloff = 999

      require('mini.basics').setup(opts)
    end,
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
    config = function()
      local hipatterns = require 'mini.hipatterns'

      hipatterns.setup {
        highlighters = {
          -- Highlight standalone 'FIX', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
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
}
