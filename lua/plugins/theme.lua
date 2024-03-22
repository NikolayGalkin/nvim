return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          NvimTreeFolderArrowClosed = { fg = colors.blue },
          NvimTreeFolderArrowOpen = { fg = colors.blue },
        }
      end,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
