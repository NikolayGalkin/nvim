vim.keymap.set('n', '<leader>q', ':qa<cr>', {})
-- vim.keymap.set('n', '<leader>x', ':q<cr>', {})
vim.keymap.set('n', '<leader>w', ':w<cr>', {})

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<cr>')
vim.keymap.set('n', '<c-j>', ':wincmd j<cr>')
vim.keymap.set('n', '<c-h>', ':wincmd h<cr>')
vim.keymap.set('n', '<c-l>', ':wincmd l<cr>')
