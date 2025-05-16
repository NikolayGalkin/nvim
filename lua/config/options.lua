vim.g.editorconfig = true

-- vim.opt.shortmess = vim.opt.shortmess + "I"

-- vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
-- vim.opt.smartindent = true
-- vim.opt.wrap = false

vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undofile = true

-- vim.opt.incsearch = true
vim.opt.inccommand = "split"
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true

-- vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"

vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.winborder = "rounded"

-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"

vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true

-- vim.opt.mouse = "a"

vim.opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.opt.winblend = 0

-- Disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

-- vim.opt.rocks.hererocks = false
-- vim.opt.rocks.enabled = false
