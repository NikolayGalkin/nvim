return {
  "echasnovski/mini.bufremove",
  opts = {},
  keys = {
    {
      "<leader>x",
      function()
        require("mini.bufremove").delete()
      end,
      desc = "Remove Buffer",
    },
  },
}
