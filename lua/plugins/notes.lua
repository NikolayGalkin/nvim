return {
  'epwalsh/obsidian.nvim',
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/Documents/obsidian/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  init = function()
    vim.opt.conceallevel = 2
  end,
  opts = {
    templates = {
      subdir = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      substitutions = {},
    },
    daily_notes = {
      folder = '_dailies',
      date_format = '%Y-%m-%d',
      alias_format = '%B %-d, %Y',
      template = nil,
    },
    completion = {
      nvim_cmp = true,
      min_chars = 1,
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
    picker = {
      name = 'telescope.nvim',
    },
    ---@param url string
    follow_url_func = function(url)
      vim.fn.jobstart { 'open', url } -- Mac OS
    end,
  },
  keys = {
    { '<leader>ol', '<cmd>ObsidianDailies<cr>', desc = 'Obsidian Dailies' },
    { '<leader>od', '<cmd>ObsidianToday<cr>', desc = 'Obsidian Today' },
    { '<leader>of', '<cmd>ObsidianFollowLink<cr>', desc = 'Obsidian Follow Link' },
  },
}
