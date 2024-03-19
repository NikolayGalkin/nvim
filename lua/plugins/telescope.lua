return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope Find Files" },
    { "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Telescope Find Words" },
  }
}
