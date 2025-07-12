return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
    },
    ft = { "markdown", "Avante" },

    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      file_types = { "markdown", "Avante" },
      completions = {
        blink = {
          enabled = true,
        },
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "Kicamon/markdown-table-mode.nvim",
    ft = { "markdown" },
    cmd = "Mtm",
    opts = {},
  },
  {
    "Myzel394/easytables.nvim",
    ft = { "markdown" },
    opts = {},
  },
}
