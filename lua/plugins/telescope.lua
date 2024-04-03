return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'

      telescope.setup {
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        defaults = {
          path_display = { 'truncate ' },
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous, -- move to prev result
              ['<C-j>'] = actions.move_selection_next, -- move to next result
              ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {},
          },
        },
      }

      telescope.load_extension 'fzf'
      telescope.load_extension 'ui-select'
    end,
    keys = {
      {
        '<leader>ff',
        "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
        desc = 'Telescope Find Files',
      },
      { '<leader>fw', '<cmd>Telescope live_grep<CR>', desc = 'Telescope Find Words' },
      -- { '<leader>fb', '<cmd>Telescope file_browser<CR>', desc = 'Telescope File browser' },
    },
  },
}
