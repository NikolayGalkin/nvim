return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        transparent = false,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        on_highlights = function(hl, c)
          hl.LineNrAbove = {
            fg = c.comment,
          }
          hl.LineNrBelow = {
            fg = c.comment,
          }
        end,
      }
    end,
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight-moon")
    end,
  },
}
