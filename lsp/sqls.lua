local Lsp = require("utils.lsp")

---@brief
---
--- https://github.com/artempyanykh/marksman
---
--- Marksman is a Markdown LSP server providing completion, cross-references, diagnostics, and more.
---
--- Marksman works on MacOS, Linux, and Windows and is distributed as a self-contained binary for each OS.
---
--- Pre-built binaries can be downloaded from https://github.com/artempyanykh/marksman/releases

return {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql", "mysql" },
  single_file_support = true,
  settings = {},
  on_attach = Lsp.on_attach,
}
