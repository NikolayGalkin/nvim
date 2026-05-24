-- =============================================================================
-- COLORSCHEME
-- =============================================================================
require('catppuccin').setup({
  flavour = 'mocha',
  transparent_background = true,
  float = { transparent = true },
  transparent_background_fluoro = true,
  custom_highlights = function()
    return {
      CursorLine = { bg = 'NONE' },
      MiniPickMatchCurrent = { bg = 'NONE' },
      StatusLine = { bg = 'NONE' },
      StatusLineNC = { bg = 'NONE' },
      MiniStatuslineDevinfo = { bg = 'NONE' },
      MiniStatuslineFilename = { bg = 'NONE' },
      MiniStatuslineFileinfo = { bg = 'NONE' },
      MiniStatuslineInactive = { bg = 'NONE' },
    }
  end,
  integrations = {
    mini = { enabled = true },
    snacks = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
    },
  },
})
