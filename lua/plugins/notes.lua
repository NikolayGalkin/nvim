return {
  'epwalsh/obsidian.nvim',
  event = {
    'BufWinEnter ' .. vim.fn.expand '~' .. '/Documents/obsidian*',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'L3MON4D3/LuaSnip',
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
  config = function(_, opts)
    require('obsidian').setup(opts)
    local ls = require 'luasnip'
    local fmt = require('luasnip.extras.fmt').fmt
    local s = ls.snippet
    -- local i = ls.insert_node
    -- local f = ls.function_node

    ls.add_snippets('markdown', {
      s(
        'sync',
        fmt(
          [[
          ## sync "date"
          - updates
            - nothing
          - todo leads
            - nothing
          - TODO: 
            - [ ] nothing
          ]],
          {}
        )
      ),
    })
  end,
  keys = {
    { '<leader>od', '<cmd>ObsidianDailies<cr>', desc = 'Obsidian Dailies' },
    { '<leader>ot', '<cmd>ObsidianToday<cr>', desc = 'Obsidian Today' },
    { '<leader>otg', '<cmd>ObsidianTags<cr>', desc = 'Obsidian Tags' },
    { '<leader>of', '<cmd>ObsidianFollowLink<cr>', desc = 'Obsidian Follow Link' },
  },
}
