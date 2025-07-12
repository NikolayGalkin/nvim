return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    input = { enabled = true },
    statuscolumn = { enabled = true },
  },
  keys = {
    {
      "<leader>gg",
      function()
        require("snacks").lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>tt",
      function()
        require("snacks").terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<leader>tg",
      function()
        require("snacks").terminal("gemini", { win = { style = "float" } })
      end,
      desc = "Toggle Terminal",
    },
  },
}
