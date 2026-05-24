require('obsidian').setup({
  legacy_commands = false, -- this will be removed in 4.0.0
  ui = { enable = false },
  workspaces = {
    {
      name = 'wiki',
      path = vim.env.OBSIDIAN_VAULT,
    },
  },
})
