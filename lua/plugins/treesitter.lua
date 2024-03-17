return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'lua', 'toml' },
    hightlight = { enable = true },
    indent = { enble = true },
  },
}
