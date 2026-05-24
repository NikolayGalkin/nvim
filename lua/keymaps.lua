vim.keymap.set("x", "p", [["_dP]], { desc = "paste without losing yanked buffer" })

vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>re", ":restart<cr>")

-- complete
-- Cycle forward/backward through the popup menu
vim.keymap.set("i", "<C-j>", 'pumvisible() ? "<C-n>" : "<C-j>"', { expr = true })
vim.keymap.set("i", "<C-k>", 'pumvisible() ? "<C-p>" : "<C-k>"', { expr = true })
vim.keymap.set("i", "<tab>", 'pumvisible() ? "<C-n>" : "<tab>"', { expr = true })
vim.keymap.set("i", "<S-tab>", 'pumvisible() ? "<C-p>" : "<S-tab>"', { expr = true })

vim.keymap.set("n", "<leader>h", ":Pick help<cr>")

vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", { desc = "File explorer" })
vim.keymap.set("n", "<leader>x", "<cmd>lua MiniBufremove.delete()<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>fw", "<cmd>Pick grep_live<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fd", "<cmd>Pick diagnostic<cr>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>ff", function()
  require("mini.pick").builtin.cli({
    command = { "fd", "--hidden", "--type", "f", "--exclude", ".git" },
  })
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>gg", function()
  require("snacks").lazygit()
end, { desc = "LazyGit" })
vim.keymap.set("n", "<leader>tt", function()
  require("snacks").terminal()
end, { desc = "Terminal" })
vim.keymap.set("n", "<leader>ai", function()
  require("snacks").terminal("opencode", { win = { style = "float", border = "rounded" } })
end, { desc = "AI" })
vim.keymap.set("n", "<leader>ih", function()
  require("snacks").image.hover()
end, { desc = "Image preview" })
