return {
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    init = function()
      vim.g.lazygit_use_neovim_remote = 0
    end,
    keys = {
      { '<leader>gg', ':LazyGit<cr>', desc = 'Join Toggle' },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('gitsigns').setup {}
      vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<cr>', {})
      vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<cr>', {})
    end,
  },
  {
    'wintermute-cell/gitignore.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      { '<leader>gi', '<cmd>Gitignore<cr>', desc = 'Generate Gitignore file' },
    },
  },
}
