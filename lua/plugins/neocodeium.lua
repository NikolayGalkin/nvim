return {
  "monkoose/neocodeium",
  event = "InsertEnter",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()

    vim.keymap.set("i", "<A-i>", function()
      neocodeium.open()
    end, { desc = "Open Noocodium" })
    vim.keymap.set("i", "<A-f>", function()
      neocodeium.accept()
    end, { desc = "Accept Neocodeium" })
  end,
}
