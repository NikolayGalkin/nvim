return {
  'epwalsh/obsidian.nvim',
  lazy = true,
  ft = 'markdown',
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
    workspaces = {
      {
        name = 'work',
        path = '~/Documents/obsidian',
      },
    },
  },
  config = function(_, opts)
    vim.opt_local.conceallevel = 2
    require('obsidian').setup(opts)
  end,
}

-- FIX:: obsidian is not working after opening a file on second time
