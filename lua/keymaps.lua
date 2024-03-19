vim.keymap.set('n', '<leader>q', ':qa<CR>', {})
-- vim.keymap.set('n', '<leader>x', ':q<CR>', {})
vim.keymap.set('n', '<leader>w', ':w<CR>', {})


-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
