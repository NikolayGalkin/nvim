return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'maxmellon/vim-jsx-pretty',
  },
  opts = function(_, opts)
    vim.list_extend(opts, {
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
        'kdl',
      },
      hightlight = { enable = true },
      indent = { enble = true },
    })
  end,
  config = function(_, opts)
    require('nvim-treesitter').setup(opts)
    require('nvim-treesitter.configs').setup {
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        -- filetypes = { 'html', 'xml', 'typescript', 'javascript', 'tsx' },
      },
    }
  end,
}
