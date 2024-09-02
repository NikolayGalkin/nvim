return {
  "romgrk/barbar.nvim",
  event = "BufReadPost",
  dependencies = {
    -- 'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  opts = {
    auto_hide = true,
    sidebar_filetypes = {
      NvimTree = true,
    },
  },
  config = function()
    local barbar = require("barbar")
    barbar.setup({
      auto_hide = true,
      sidebar_filetypes = {
        NvimTree = true,
      },
    })
    vim.keymap.set("n", "]b", ":BufferNext<cr>", { desc = "Buffer Next" })
    vim.keymap.set("n", "[b", ":BufferPrev<cr>", { desc = "Buffer Prev" })
    vim.keymap.set("n", "<leader>x", ":BufferClose<cr>", { desc = "Buffer Close" })
  end,
}
