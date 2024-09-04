return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
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

      return "\u{f085} " .. table.concat(c, " & ")
    end
    return {
      sections = {
        lualine_x = { "encoding", "fileformat", "filetype", clients_lsp },
      },
    }
  end,
}
