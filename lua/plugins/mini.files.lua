return {
  "echasnovski/mini.files",
  opts = {
    windows = {
      preview = true,
      width_preview = 65,
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open()
      end,
      { desc = "Mini Files" },
    },
  },
}
