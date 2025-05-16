local Lsp = require("utils.lsp")
local ss = require("schemastore")

return {
  cmd = { "vscode-json-language-server", "--stdio" },
  on_attach = Lsp.on_attach,
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = true,
  },
  settings = {
    json = {
      schemas = ss.json.schemas(),
    },
  },
  -- root_dir = function(fname)
  --   return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
  -- end,
  single_file_support = true,
}
