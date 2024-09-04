return {
  "akinsho/toggleterm.nvim",
  opts = {
    shade_terminals = true,
    winbar = {
      enabled = true,
    },
  },
  keys = {
    { "<leader>tt", ":ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm" },
    { "<leader>tf", ":ToggleTerm direction=float<cr>", desc = "ToggleTerm" },
  },
}
