return {
  {
    'akinsho/bufferline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*',
    after = 'catppuccin',
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
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function(_, opts)
      local lazy_status = require 'lazy.status' -- to configure lazy pending updates count

      local clients_lsp = function()
        local bufnr = vim.api.nvim_get_current_buf()

        local clients = vim.lsp.get_clients { bufnr = bufnr }
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
        options = {
          theme = 'catppuccin',
        },
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
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
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
    -- config = function(_, opts)
    --   require('noice').setup(opts)
    --   require('notify').setup {
    --     background_colour = '#000000',
    --   }
    -- end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {},
    keys = { -- Example mapping to toggle outline
      { '<leader>td', '<cmd>TodoTrouble<CR>', desc = 'Todo Trouble' },
    },
  },
  {
    'folke/trouble.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      {
        'RRethy/vim-illuminate',
        config = function()
          require('illuminate').configure()
        end,
      },
    },
    cmd = { 'Trouble' },
  },
  {
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    opts = {},
    keys = { -- Example mapping to toggle outline
      { '<leader>a', '<cmd>Outline<CR>', desc = 'Toggle outline' },
    },
  },
  {
    'tris203/precognition.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },
}
