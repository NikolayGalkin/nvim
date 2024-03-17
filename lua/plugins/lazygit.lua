return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.g.lazygit_use_neovim_remote = 0
  end,
  keys = {
    { '<leader>gg', ':LazyGit<CR>', desc = 'Join Toggle' },
  },
}
