return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  opts = {
    ensure_installed = { 'lua', 'toml', 'markdown', 'markdown_inline', 'vim', 'gitignore' },
    hightlight = { enable = true },
    indent = { enble = true },
  },
}
