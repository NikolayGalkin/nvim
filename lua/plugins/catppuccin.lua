return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    transparent_background = true,
    flavour = "macchiato",
    integrations = {
      mason = true,
      barbar = false,
      telescope = {
        enabled = true,
      },
      lsp_trouble = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
