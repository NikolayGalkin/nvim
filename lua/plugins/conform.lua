return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },

  ---@module 'conform'
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      typescript = { "biome", "prettier", stop_after_first = true },
      javascript = { "biome", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettier", stop_after_first = true },
      markdown = { "prettier" },
      html = { "prettier" },
      rust = { "rustfmt" },
      toml = { "taplo" },
      sql = { "sqlfluff" },
      -- nix = { "nixpkgs_fmt" },
    },

    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
