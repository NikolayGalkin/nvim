return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  opts = {
    view = {
      width = 35,
      side = "left",
      relativenumber = true,
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    { "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Nvim Tree Focus" },
  },
}
