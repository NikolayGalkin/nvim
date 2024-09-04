return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  -- tag = "v0.9.2",
  build = ":TSUpdate",
  config = function(_, _)
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "html" },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    })
  end,
}
