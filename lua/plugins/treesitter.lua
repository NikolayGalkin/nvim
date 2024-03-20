return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'maxmellon/vim-jsx-pretty',
  },
  opts = {
    ensure_installed = {
      'lua',
      'toml',
      'markdown',
      'markdown_inline',
      'vim',
      'gitignore',
      'bash',
      'regex',
      'typescript',
      'javascript',
      'tsx',
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
        filetypes = { 'html', 'xml', 'typescriptreact' },
      },
    }
  end,
}
