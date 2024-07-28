local map = vim.keymap.set
local function get_opts(desc, expr)
  return { noremap = true, silent = true, desc = desc, expr = expr or false }
end

map('n', '<c-d>', '<c-d>zz', get_opts 'Scroll down half a page')
map('n', '<c-u>', '<c-u>zz', get_opts 'Scroll up half a page')
-- map('n', 'j', 'jzz')
-- map('n', 'k', 'kzz')

-- Better J/K
map('n', 'j', [[(v:count > 1 ? "m'" . v:count : '') . 'gj']], get_opts('Jump list relative line jump', true))
map('n', 'k', [[(v:count > 1 ? "m'" . v:count : '') . 'gk']], get_opts('Jump list relative line jump', true))
-- better up/down
-- buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', get_opts 'Previous Bufer')
map('n', '<S-l>', '<cmd>bnext<cr>', get_opts 'Next Buffer')

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', get_opts 'Escape from search')

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', get_opts 'Lazy')

map('i', 'jj', '<esc>', get_opts 'Better Esc')

map('n', '<leader>w', '<cmd>w<cr>', get_opts 'Save File')
map('n', '<leader>q', '<cmd>qa!<cr>', get_opts 'Quit Nvim')
