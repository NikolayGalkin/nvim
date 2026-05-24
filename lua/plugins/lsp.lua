vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

vim.lsp.enable({ 'lua_ls', 'taplo' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
    end
    map('gd', vim.lsp.buf.definition, 'Go to definition')
    map('gr', vim.lsp.buf.references, 'Go to references')
    map('K', vim.lsp.buf.hover, 'Hover')
    map('<leader>rn', vim.lsp.buf.rename, 'Rename')
    map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
  end,
})
