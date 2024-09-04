return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function(_, opts)
    local clients_lsp = function()
      local bufnr = vim.api.nvim_get_current_buf()

      local clients = vim.lsp.buf_get_clients(bufnr)
      if next(clients) == nil then
        return ""
      end

      local c = {}
      for _, client in pairs(clients) do
        table.insert(c, client.name)
      end

      return "\u{f085} " .. table.concat(c, "|")
    end
    table.insert(opts.sections.lualine_b, clients_lsp)
    require("lualine").setup(opts)
  end,
}
