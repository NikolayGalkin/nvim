return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>r",
      kulala_keymaps_prefix = "",
      ui = {
        display_mode = "float",
      },
    },
    keys = {
      {
        "<leader>rs",
        function()
          require("kulala").run()
        end,
        desc = "Send HTTP Request",
      },
    },
  },
}
