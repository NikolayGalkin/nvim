return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  config = function()
    require("gitsigns").setup({
      numhl = true,
    })

    vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_linehl<cr>", { desc = "Gitsigns Toggle Linehl" })
    vim.keymap.set("n", "<leader>gn", ":Gitsigns toggle_numhl<cr>", { desc = "Gitsigns Toggle Num" })
  end,
}
