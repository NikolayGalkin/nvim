return {
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      view = {
        adaptive_size = false,
        side = 'left',
        width = 30,
        preserve_window_proportions = true,
      },
    },
    keys = {
      { '<leader>e', '<cmd>NvimTreeFocus<cr>', desc = 'NeoTree' },
    },
  },
}
