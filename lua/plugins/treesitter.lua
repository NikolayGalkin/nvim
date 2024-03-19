return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'lua', 'toml', 'markdown', 'markdown_inline' },
    hightlight = { enable = true },
    indent = { enble = true },
  },
}
