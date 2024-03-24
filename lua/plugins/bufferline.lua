return {
  'akinsho/bufferline.nvim',
  event = 'BufEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'famiu/bufdelete.nvim',
  },
  opts = {
    options = {
      mode = 'buffers',
      numbers = 'ordinal',
      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = false,
      color_icons = true,
      close_command = 'Bdelete! %d',
      show_close_icon = true,
      show_buffer_close_icons = true,
      offsets = {
        {
          filetype = 'NvimTree',
          text = '',
          text_align = 'center',
          padding = 1,
          separator = true,
        },
      },
    },
  },
  config = function(_, opts)
    local bufferline = require 'bufferline'

    bufferline.setup(opts)
    vim.keymap.set('n', '<tab>', function()
      bufferline.cycle(1)
    end, {})
    vim.keymap.set('n', '<S-tab>', function()
      bufferline.cycle(-1)
    end, {})
    vim.keymap.set('n', '<leader>x', function()
      require('bufdelete').bufdelete(0)
    end, { desc = 'Buffer Close' })
  end,
}
