return {
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_transparent_background = true
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_style = 'andromeda'
      -- vim.g.sonokai_style = 'maia'
      vim.cmd.colorscheme 'sonokai'
    end,
  },
  {
    'folke/tokyonight.nvim',
    event = 'VeryLazy',
    config = function()
      local bg = '#011628'
      local bg_dark = '#011423'
      local bg_highlight = '#143652'
      local bg_search = '#0A64AC'
      local bg_visual = '#275378'
      local fg = '#CBE0F0'
      local fg_dark = '#B4D0E9'
      local fg_gutter = '#627E97'
      local border = '#547998'

      require('tokyonight').setup {
        style = 'night',
        -- transparent = true,
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = bg_dark
          colors.bg_float = bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = bg_dark
          colors.bg_statusline = bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
      }

      -- vim.cmd.colorscheme 'tokyonight'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    event = 'VeryLazy',
    -- priority = 1000,
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
        integrations = {
          mini = {
            enabled = true,
            indentscope_color = '',
          },

          native_lsp = {
            enabled = true,
            underlines = {
              errors = { 'undercurl' },
              hints = { 'undercurl' },
              warnings = { 'undercurl' },
              information = { 'undercurl' },
            },
          },
          mason = true,
          symbols_outline = true,
          lsp_trouble = true,
          which_key = true,
          noice = true,
          notify = true,
        },
      }
      -- vim.cmd.colorscheme 'catppuccin'
      vim.cmd [[highlight Visual cterm=reverse gui=reverse]]
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    event = 'VeryLazy',
    config = function()
      require('github-theme').setup {
        options = {
          styles = {
            comments = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
          },
        },
      }
    end,
  },
  {
    'akinsho/bufferline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'catppuccin/nvim',
      'echasnovski/mini.bufremove',
    },
    opts = function()
      return {
        options = {
          numbers = 'ordinal',
          diagnostics = 'nvim_lsp',
          separator_style = 'thin',
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'Explorer',
              text_align = 'left',
              separator = true,
            },
          },
          color_icons = true,
          close_command = function(bufnr)
            require('mini.bufremove').delete(bufnr, false)
          end,
          diagnostics_indicator = function(_, _, diagnostics_dict)
            local s = ' '
            for e, n in pairs(diagnostics_dict) do
              local sym = e == 'error' and '  ' or (e == 'warning' and '  ' or ' ')
              s = s .. n .. sym
            end
            return s
          end,
          highlights = require('catppuccin.groups.integrations.bufferline').get(),
        },
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function(_, opts)
      local lazy_status = require 'lazy.status' -- to configure lazy pending updates count

      local clients_lsp = function()
        local bufnr = vim.api.nvim_get_current_buf()

        local clients = vim.lsp.buf_get_clients(bufnr)
        if next(clients) == nil then
          return ''
        end

        local c = {}
        for _, client in pairs(clients) do
          table.insert(c, client.name)
        end
        return '  ' .. table.concat(c, '|')
      end

      local default_icon = '  '
      local mode_map = {
        ['NORMAL'] = '󰘳  ',
        ['O-PENDING'] = '  ',
        ['INSERT'] = '  ',
        ['VISUAL'] = '󰒉  ',
        ['V-BLOCK'] = '󰒉  ',
        ['V-LINE'] = '󰒉  ',
        ['V-REPLACE'] = '  ',
        ['REPLACE'] = '󰛔  ',
        ['COMMAND'] = '󰘳  ',
        ['SHELL'] = '  ',
        ['TERMINAL'] = '  ',
        ['EX'] = '  ',
        ['S-BLOCK'] = '  ',
        ['S-LINE'] = '  ',
        ['SELECT'] = '  ',
        ['CONFIRM'] = '  ',
        ['MORE'] = '  ',
      }

      -- local colors = {
      --   blue = '#65D1FF',
      --   green = '#3EFFDC',
      --   violet = '#FF61EF',
      --   yellow = '#FFDA7B',
      --   red = '#FF4A4A',
      --   fg = '#c3ccdc',
      --   bg = '#112638',
      --   inactive_bg = '#2c3043',
      -- }

      -- local theme = {
      --   normal = {
      --     a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
      --     b = { bg = colors.bg, fg = colors.fg },
      --     c = { bg = colors.bg, fg = colors.fg },
      --   },
      --   insert = {
      --     a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
      --     b = { bg = colors.bg, fg = colors.fg },
      --     c = { bg = colors.bg, fg = colors.fg },
      --   },
      --   visual = {
      --     a = { bg = colors.violet, fg = colors.bg, gui = 'bold' },
      --     b = { bg = colors.bg, fg = colors.fg },
      --     c = { bg = colors.bg, fg = colors.fg },
      --   },
      --   command = {
      --     a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
      --     b = { bg = colors.bg, fg = colors.fg },
      --     c = { bg = colors.bg, fg = colors.fg },
      --   },
      --   replace = {
      --     a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
      --     b = { bg = colors.bg, fg = colors.fg },
      --     c = { bg = colors.bg, fg = colors.fg },
      --   },
      --   inactive = {
      --     a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
      --     b = { bg = colors.inactive_bg, fg = colors.semilightgray },
      --     c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      --   },
      -- }

      return vim.tbl_extend('force', opts, {
        -- options = {
        --   theme = theme,
        -- },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(s)
                local icon = mode_map[s] or default_icon
                -- local icon = mode_map[s] or default_icon
                return icon .. s
              end,
            },
          },
          lualine_b = {
            {
              'diagnostics',
              symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
              colored = true, -- Displays diagnostics status in color if set to true.
              update_in_insert = false, -- Update diagnostics in insert mode.
              always_visible = false, -- Show diagnostics even if there are none.
            },
            'branch',
            'diff',
            'diagnostics',
          },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = '#ff9e64' },
            },
            {
              require('noice').api.status.mode.get,
              cond = require('noice').api.status.mode.has,
              color = { link = 'lualine_b_diff_added_insert' },
            },
            { 'encoding' },
            { 'fileformat' },
            { 'filetype' },
          },
          lualine_y = {
            { clients_lsp },
            'progress',
          },
        },
      })
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    version = '*',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
          ['vim.lsp.util.stylize_markdown'] = false,
          ['cmp.entry.get_documentation'] = false, -- requires hrsh7th/nvim-cmp
        },
      },
      -- -- you can enable a preset for easier configuration
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        --   long_message_to_split = true, -- long messages will be sent to a split
        --   inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    config = function(_, opts)
      require('noice').setup(opts)
      require('notify').setup {
        background_colour = '#000000',
      }
    end,
  },
  {
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    opts = {},
    keys = { -- Example mapping to toggle outline
      { '<leader>a', '<cmd>Outline<CR>', desc = 'Toggle outline' },
    },
  },
  -- {
  --   'shellRaining/hlchunk.nvim',
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   opts = {
  --     chunk = {
  --       notify = false,
  --       chars = {
  --         horizontal_line = '─',
  --         vertical_line = '│',
  --         left_top = '┌',
  --         left_bottom = '└',
  --         right_arrow = '─',
  --       },
  --       style = '#00ffff',
  --     },
  --     blank = { enable = false },
  --   },
  -- },
}
