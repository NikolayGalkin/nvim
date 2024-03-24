return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'maxmellon/vim-jsx-pretty',
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      ensure_installed = {
        'css',
        'scss',
        'gitcommit',
        'gitignore',
        'http',
        'lua',
        'toml',
        'markdown',
        'markdown_inline',
        'vim',
        'bash',
        'regex',
        'typescript',
        'javascript',
        'tsx',
        'kdl', -- zellij )
      },
      hightlight = { enable = true },
      indent = { enble = true },
    },
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
      require('nvim-treesitter.configs').setup {
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['of'] = '@function.outer',
              ['if'] = '@function.inner',
              ['oc'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true or false
          include_surrounding_whitespace = true,
        },
      }
    end,
  },
}
