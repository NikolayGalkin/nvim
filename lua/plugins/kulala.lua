return {
  "mistweaverco/kulala.nvim",
  ft = "http",
  opts = {},
  init = function()
    vim.filetype.add({
      extension = {
        ["http"] = "http",
      },
    })
  end,
  config = function(_, opts)
    require("kulala").setup(opts)
    vim.api.nvim_set_keymap("n", "<cr>", ":lua require('kulala').run()<cr>", { noremap = true, silent = true })
  end,
}
