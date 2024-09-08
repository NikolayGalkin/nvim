return {
  "akinsho/bufferline.nvim",
  event = "BufReadPost",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        style_preset = bufferline.style_preset.no_italic,
      },
    })
  end,
}
