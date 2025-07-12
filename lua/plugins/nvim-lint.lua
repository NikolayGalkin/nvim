return {
  "mfussenegger/nvim-lint",
  event = { "InsertLeave", "BufReadPost", "BufWritePost" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      lua = { "luacheck" },
      python = { "mypy", "ruff" },
      typescript = { "biomejs" },
      javascript = { "biomejs" },
      typescriptreact = { "biomejs" },
      javascriptreact = { "biomejs" },
      rust = { "clippy" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "InsertLeave", "BufReadPost", "BufWritePost" }, {
      group = lint_augroup,
      callback = function()
        require("lint").try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>d", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
