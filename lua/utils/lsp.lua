local M = {}

-- Get default LSP keymaps without any plugin dependencies
function M.get_default_keymaps()
  return {
    { keys = "<leader>ca", func = vim.lsp.buf.code_action, desc = "Code Actions" },
    { keys = "<leader>.", func = vim.lsp.buf.code_action, desc = "Code Actions" },
    { keys = "<leader>cr", func = vim.lsp.buf.rename, desc = "Code Rename" },
    -- { keys = "<leader>cf", func = vim.lsp.buf.format, desc = "Code Format" },
    -- { keys = "<leader>k", func = vim.lsp.buf.hover, desc = "Documentation", has = "hoverProvider" },
    -- { keys = "K", func = vim.lsp.buf.hover, desc = "Documentation", has = "hoverProvider" },
    -- { keys = "gd", func = vim.lsp.buf.definition, desc = "Goto Definition", has = "definitionProvider" },
    -- NOTE: Use snack UI for below keymaps
    -- { keys = "gD", func = vim.lsp.buf.declaration, desc = "Goto Declaration", has = "declarationProvider" },
    -- { keys = "gr", func = vim.lsp.buf.references, desc = "Goto References", has = "referencesProvider", nowait = true },
    -- { keys = "gi", func = vim.lsp.buf.implementation, desc = "Goto Implementation", has = "implementationProvider" },
    -- { keys = "gy", func = vim.lsp.buf.type_definition, desc = "Goto Type Definition", has = "typeDefinitionProvider" },
  }
end

M.on_attach = function(client, buffer)
  local keymaps = M.get_default_keymaps()
  for _, keymap in ipairs(keymaps) do
    if not keymap.has or client.server_capabilities[keymap.has] then
      vim.keymap.set(keymap.mode or "n", keymap.keys, keymap.func, {
        buffer = buffer,
        desc = "LSP: " .. keymap.desc,
        nowait = keymap.nowait,
      })
    end
  end
end

return M
