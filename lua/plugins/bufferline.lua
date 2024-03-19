return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'famiu/bufdelete.nvim',
  },
  config = function()
    local bufferline = require 'bufferline'

    bufferline.setup {
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
    }
    vim.keymap.set('n', '<tab>', function()
      bufferline.cycle(1)
    end, {})
    vim.keymap.set('n', '<S-tab>', function()
      bufferline.cycle(-1)
    end, {})
    vim.keymap.set('n', '<leader>x', function()
      require('bufdelete').bufdelete(0)
    end, {})
  end,
}
