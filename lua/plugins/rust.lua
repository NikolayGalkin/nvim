return {
  "cordx56/rustowl",
  version = "*", -- Latest stable version
  build = "cargo binstall rustowl",
  ft = "rust",
  enabled = false,
  -- lazy = false, -- This plugin is already lazy
  opts = {
    auto_enable = false,
    client = {
      on_attach = function(_, buffer)
        vim.keymap.set("n", "<leader>o", function()
          require("rustowl").toggle(buffer)
        end, { buffer = buffer, desc = "Toggle RustOwl" })
      end,
    },
  },
}
