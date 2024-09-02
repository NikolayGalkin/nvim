return {
  "akinsho/toggleterm.nvim",
  opts = {
    shade_terminals = true,
    winbar = {
      enabled = true,
    },
  },
  keys = {
    { "<leader>tt", ":ToggleTerm<cr>", desc = "ToggleTerm" },
  },
}
