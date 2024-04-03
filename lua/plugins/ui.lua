return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    -- priority = 1000,
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
        integrations = {
          mini = {
            enabled = true,
            -- indentscope_color = '',
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
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd [[highlight Visual cterm=reverse gui=reverse]]
    end,
  },
  {
    'akinsho/bufferline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    -- version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'catppuccin/nvim',
    },
    opts = function()
      return {
        options = {
          numbers = 'ordinal',
          diagnostics = 'nvim_lsp',
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'Explorer',
              text_align = 'left',
              separator = true,
            },
          },
          color_icons = true,
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
    opts = {
      options = {
        theme = 'catppuccin',
      },
    },
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
  },
  {
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    opts = {},
    keys = { -- Example mapping to toggle outline
      { '<leader>a', '<cmd>Outline<CR>', desc = 'Toggle outline' },
    },
  },
}
