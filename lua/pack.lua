vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/catppuccin/nvim.git", name = "catppuccin" },
  { src = "https://github.com/rachartier/tiny-cmdline.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  {
    src = "https://github.com/obsidian-nvim/obsidian.nvim",
    version = vim.version.range("*"), -- use latest release, remove to use latest commit
  },
  { src = "https://github.com/OXY2DEV/markview.nvim" },
})

require("plugins.colorscheme")
require("plugins.ui")
require("plugins.treesitter")
require("plugins.mini")
require("plugins.lsp")
require("plugins.format")
require("plugins.mason")
require("plugins.obsidian")
