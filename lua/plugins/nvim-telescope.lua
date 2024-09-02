return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
  cmd = "Telescope",
  opts = function()
    local actions = require("telescope.actions")
    return {
      pickers = {
        find_files = {
          hidden = true,
        },
        colorscheme = { enable_preview = true },
      },
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("ui-select")
  end,

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Treesitter Find Files" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Treesitter Find Word" },
  },
}
