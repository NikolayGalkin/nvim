return {
  "romgrk/barbar.nvim",
  event = "BufReadPost",
  dependencies = {
    -- 'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  config = function()
    require("barbar").setup({
      auto_hide = false,
      sidebar_filetypes = {
        NvimTree = true,
      },
    })
    vim.keymap.set("n", "]b", ":BufferNext<cr>", { desc = "Buffer Next" })
    vim.keymap.set("n", "[b", ":BufferPrev<cr>", { desc = "Buffer Prev" })
    vim.keymap.set("n", "<leader>x", ":BufferClose<cr>", { desc = "Buffer Close" })
  end,
}
