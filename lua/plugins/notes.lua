return {
  'epwalsh/obsidian.nvim',
  -- ft = 'markdown',
  -- lazy = true,
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/Documents/obsidian/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    templates = {
      subdir = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      substitutions = {},
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    workspaces = {
      {
        name = 'work',
        path = '~/Documents/obsidian',
      },
    },
    ui = {
      enable = true,
    },
  },
}
