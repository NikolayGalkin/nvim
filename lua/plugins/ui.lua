require('tiny-cmdline').setup()

-- require('markview').setup({
--   preview = {
--     icon_provider = 'mini', -- "mini" or "devicons"
--   },
-- })

require('render-markdown').setup({
  render_modes = { 'n', 't' },
  completions = { lsp = { enabled = true } },
})

require('snacks').setup({
  input = {
    enabled = true,
    win = {
      relative = 'editor',
      position = 'float',
      row = 0.4,
      col = 0.5,
      anchor = 'NW',
    },
  },
  notifier = { enabled = false },
  statuscolumn = { enabled = true },
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  lazygit = { enabled = true },
  terminal = { enabled = true },
  image = { enabled = true },
  toggle = { enabled = true },
})
