vim.g.mapleader = " "
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.wrap = false
vim.o.smartindent = true
vim.o.inccommand = "split"

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.laststatus = 3

vim.o.swapfile = false
vim.o.backup = false

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undodir"

vim.o.termguicolors = true
vim.o.scrolloff = 8

vim.o.colorcolumn = "0"
vim.o.signcolumn = "yes"
vim.o.cmdheight = 0

vim.o.winborder = "rounded"
vim.o.conceallevel = 2

vim.o.autocomplete = true
vim.o.pumheight = 5
vim.o.pumborder = "rounded"
vim.opt.complete:append("o")
vim.opt.completeopt = { "menu", "noselect", "noinsert", "fuzzy", "popup" }

vim.opt.clipboard:append("unnamedplus")
vim.opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
