return {
  -- {
  --   'sainnhe/sonokai',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.sonokai_transparent_background = false
  --     vim.g.sonokai_enable_italic = true
  --     vim.g.sonokai_style = 'andromeda'
  --     -- vim.g.sonokai_style = 'maia'
  --     -- vim.cmd.colorscheme 'sonokai'
  --   end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   event = 'VeryLazy',
  --   config = function()
  --     local bg = '#011628'
  --     local bg_dark = '#011423'
  --     local bg_highlight = '#143652'
  --     local bg_search = '#0A64AC'
  --     local bg_visual = '#275378'
  --     local fg = '#CBE0F0'
  --     local fg_dark = '#B4D0E9'
  --     local fg_gutter = '#627E97'
  --     local border = '#547998'
  --
  --     require('tokyonight').setup {
  --       style = 'night',
  --       -- transparent = true,
  --       on_colors = function(colors)
  --         colors.bg = bg
  --         colors.bg_dark = bg_dark
  --         colors.bg_float = bg_dark
  --         colors.bg_highlight = bg_highlight
  --         colors.bg_popup = bg_dark
  --         colors.bg_search = bg_search
  --         colors.bg_sidebar = bg_dark
  --         colors.bg_statusline = bg_dark
  --         colors.bg_visual = bg_visual
  --         colors.border = border
  --         colors.fg = fg
  --         colors.fg_dark = fg_dark
  --         colors.fg_float = fg
  --         colors.fg_gutter = fg_gutter
  --         colors.fg_sidebar = fg_dark
  --       end,
  --     }
  --     -- vim.cmd.colorscheme 'tokyonight'
  --   end,
  -- },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   event = 'VeryLazy',
  --   -- priority = 1000,
  --   config = function()
  --     require('catppuccin').setup {
  --       -- transparent_background = true,
  --       integrations = {
  --         mini = {
  --           enabled = true,
  --           indentscope_color = '',
  --         },
  --         native_lsp = {
  --           enabled = true,
  --           underlines = {
  --             errors = { 'undercurl' },
  --             hints = { 'undercurl' },
  --             warnings = { 'undercurl' },
  --             information = { 'undercurl' },
  --           },
  --         },
  --         mason = true,
  --         symbols_outline = true,
  --         lsp_trouble = true,
  --         which_key = true,
  --         noice = true,
  --         notify = true,
  --       },
  --     }
  --     -- vim.cmd.colorscheme 'catppuccin'
  --     vim.cmd [[highlight Visual cterm=reverse gui=reverse]]
  --   end,
  -- },
  -- {
  --   'projekt0n/github-nvim-theme',
  --   event = 'VeryLazy',
  --   config = function()
  --     require('github-theme').setup {
  --       options = {
  --         styles = {
  --           comments = 'italic',
  --           keywords = 'bold',
  --           types = 'italic,bold',
  --         },
  --       },
  --     }
  --     -- vim.cmd.colorscheme 'github_dark'
  --   end,
  -- },
  {
    'shatur/neovim-ayu',
    event = 'VeryLazy',
    config = function()
      require('ayu').setup {
        options = {
          theme = 'ayu',
        },
      }
      vim.cmd.colorscheme 'ayu-mirage'
    end,
  },
}
