require('mini.basics').setup({
  options = {
    extra_ui = true,
    win_borders = 'rounded',
  },
  mappings = {
    windows = true,
  },
})
require('mini.files').setup()
require('mini.ai').setup()
-- require("mini.animate").setup()
require('mini.bracketed').setup()
require('mini.bufremove').setup()
require('mini.cursorword').setup()
require('mini.extra').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.git').setup()
require('mini.indentscope').setup()
require('mini.notify').setup()
require('mini.cmdline').setup()
require('mini.statusline').setup()
require('mini.pick').setup({
  mappings = {
    move_down = '<c-j>',
    move_up = '<c-k>',
  },
})
require('mini.diff').setup({
  view = { style = 'sign' },
})
require('mini.move').setup({
  mappings = {
    left = '<S-h>',
    right = '<S-l>',
    down = '<S-j>',
    up = '<S-k>',
  },
})

local MiniIcons = require('mini.icons')
MiniIcons.setup()
MiniIcons.tweak_lsp_kind()
MiniIcons.mock_nvim_web_devicons()
