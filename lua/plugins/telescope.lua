return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      -- { 'folke/todo-comments.nvim', opts = {} },
    },
    config = function()
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'
      local trouble_telescope = require 'trouble.sources.telescope'

      telescope.setup {
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        defaults = {
          path_display = { 'smart' },
          mappings = {
            i = {
              ['<c-k>'] = actions.move_selection_previous, -- move to prev result
              ['<c-j>'] = actions.move_selection_next, -- move to next result
              ['<c-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
              ['<c-t>'] = trouble_telescope.smart_open_with_trouble,
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
      { '<leader>fw', '<cmd>Telescope live_grep<cr>', desc = 'Telescope Find Words' },
      { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'Telescope File browser' },
    },
  },
}
