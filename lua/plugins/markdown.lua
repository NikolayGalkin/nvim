return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  -- dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you use standalone mini plugin
  ft = { "markdown" },

  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = {
      blink = {
        enabled = true,
      },
    },
  },
}
