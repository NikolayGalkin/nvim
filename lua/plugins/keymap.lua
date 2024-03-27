return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    window = {
      winblend = 0,
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)

    wk.register {
      ['<leader>'] = {
        w = { ':w!<cr>', 'File Save' },
        q = { ':qa!<cr>', 'Nvim Exit' },
      },
    }
    -- TODO: move to which-key
    -- wk.register {
    --   ['<c-k>'] = { ':wincmd k<cr>' },
    --   ['<c-j>'] = { ':wincmd j<cr>' },
    --   ['<c-n>'] = { ':wincmd n<cr>' },
    --   ['<c-l>'] = { ':wincmd l<cr>' },
    -- }

    vim.keymap.set('i', 'jk', '<esc>')

    -- Better indent
    vim.keymap.set('v', '<', '<gv')
    vim.keymap.set('v', '>', '>gv')

    -- Cancel search highlighting with ESC
    vim.keymap.set('n', '<esc>', ':nohlsearch<Bar>:echo<cr>')

    -- Move selected line / block of text in visual mode
    vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv")
    vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv")

    vim.keymap.set('n', '<c-k>', ':wincmd k<cr>')
    vim.keymap.set('n', '<c-j>', ':wincmd j<cr>')
    vim.keymap.set('n', '<c-h>', ':wincmd h<cr>')
    vim.keymap.set('n', '<c-l>', ':wincmd l<cr>')
  end,
}
