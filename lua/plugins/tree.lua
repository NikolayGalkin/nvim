return {
  'nvim-tree/nvim-tree.lua',
  -- event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    view = {
      width = 35,
      side = 'left',
      relativenumber = true,
    },
    -- change folder arrow icons
    renderer = {
      indent_markers = {
        enable = true,
      },
    },
    -- disable window_picker for
    -- explorer to work well with
    -- window splits
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {
      custom = { '.DS_Store' },
    },
    git = {
      ignore = false,
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  config = function(_, opts)
    require('nvim-tree').setup(opts)

    local keymap = vim.keymap -- for conciseness
    -- keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file explorer' }) -- toggle file explorer
    keymap.set('n', '<leader>ef', '<cmd>NvimTreeFocus<cr>', { desc = 'Toggle file explorer on current file' }) -- toggle file explorer on current file
    keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<cr>', { desc = 'Collapse file explorer' }) -- collapse file explorer
    keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<cr>', { desc = 'Refresh file explorer' }) -- refresh file explorer
  end,
  keys = {
    { '<leader>ee', '<cmd>NvimTreeToggle<cr>' },
  },
}
