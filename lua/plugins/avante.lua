return {
  "yetone/avante.nvim",
  event = "BufReadPost",
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    provider = "gemini",
  },
}
