require('obsidian').setup({
  legacy_commands = false, -- this will be removed in 4.0.0
  ui = { enable = false },
  daily_notes = {
    enabled = true,
    folder = 'raw/journal',
    date_format = 'YYYY/MM/YYYY-MM-DD',
    default_tags = { 'journal', 'daily' },
  },
  templates = {
    folder = 'templates',
    date_format = '%Y-%m-%d-%a',
    time_format = '%H:%M',
  },
  customizations = {
    daily = {
      notes_subdir = 'raw/journal',
    },
  },
  workspaces = {
    {
      name = 'wiki',
      path = vim.env.OBSIDIAN_VAULT,
    },
  },
})

require('markdowny').setup({ { filetypes = { 'markdown' } } })
