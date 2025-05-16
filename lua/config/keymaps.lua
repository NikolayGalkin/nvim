local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("i", "jk", "<Esc>")
-- vim.keymap.set("i", "kj", "<Esc>")

-- vim.keymap.set("n", "<c-d>", "<c-d>zz", { desc = "Half page down" })
-- vim.keymap.set("n", "<c-u>", "<c-u>zz", { desc = "Half page up" })

-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "Save File", silent = true })
vim.keymap.set("n", "<leader>q", ":qa!<cr>", { desc = "Save File" })

-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "x", '"_x', opts)
