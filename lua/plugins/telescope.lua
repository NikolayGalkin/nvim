return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local telescope = require 'telescope'

      telescope.setup {
        defaults = {
          path_display = { 'truncate ' },
        },
      }

      telescope.load_extension 'fzf'
      telescope.load_extension 'file_browser'

      local keymap = vim.keymap -- for conciseness
      keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd' })
      keymap.set('n', '<leader>fw', '<cmd>Telescope live_grep<cr>', { desc = 'Fuzzy find words in cwd' })
      keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', { desc = 'Telescope File Browser' })
    end,
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Telescope Find Files' },
      { '<leader>fw', '<cmd>Telescope live_grep<CR>', desc = 'Telescope Find Words' },
      { '<leader>fb', '<cmd>Telescope file_browser<CR>', desc = 'Telescope File browser' },
    },
  },
  --   {
  --     'nvim-telescope/telescope-file-browser.nvim',
  --     dependencies = {
  --       'nvim-telescope/telescope.nvim',
  --       'nvim-lua/plenary.nvim',
  --     },
  --     config = function()
  --       local telescope = require 'telescope'
  --
  --       telescope.load_extension 'file_browser'
  --     end,
  --     keys = {
  --       { '<leader>fb', '<cmd>Telescope file_browser<CR>', desc = 'Telescope File browser' },
  --     },
  --   },
}
