return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  opts = {
    basics = {
      options = {
        extra_ui = true,
        win_borders = "rounded",
      },
      mappings = {
        windows = true,
      },
    },
    diff = {
      view = {
        style = "sign",
      },
    },
    move = {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<c-h>",
        right = "<c-l>",
        down = "<c-j>",
        up = "<c-k>",

        -- Move current line in Normal mode
        line_left = "<c-h>",
        line_right = "<c-l>",
        line_down = "<c-j>",
        line_up = "<c-k>",
      },
    },
    pick = {
      mappings = {
        move_down = "<c-j>",
        move_up = "<c-k>",
      },
    },
  },
  config = function(_, opts)
    require("mini.ai").setup()
    require("mini.animate").setup()
    require("mini.basics").setup(opts.basics)
    require("mini.bracketed").setup()
    require("mini.bufremove").setup()
    require("mini.cursorword").setup()
    require("mini.extra").setup()
    require("mini.files").setup()
    require("mini.fuzzy").setup()
    require("mini.git").setup()
    require("mini.indentscope").setup()
    require("mini.jump").setup()
    require("mini.jump2d").setup()
    require("mini.diff").setup(opts.diff)
    require("mini.move").setup(opts.move)
    require("mini.notify").setup()
    require("mini.pairs").setup()
    require("mini.pick").setup(opts.pick)
    require("mini.splitjoin").setup()
    require("mini.statusline").setup()
    require("mini.surround").setup()

    local icons = require("mini.icons")
    icons.setup()
    icons.mock_nvim_web_devicons()

    local km = require("mini.keymap")
    km.setup()
    km.map_combo({ "i", "c", "x", "s" }, "jk", "<BS><BS><Esc>")
    km.map_combo({ "i", "c", "x", "s" }, "kj", "<BS><BS><Esc>")
    km.map_combo("t", "jk", "<BS><BS><C-\\><C-n>")
    km.map_combo("t", "kj", "<BS><BS><C-\\><C-n>")
  end,
  keys = {
    { "<leader>fh", ":Pick help<cr>", desc = "Mini Help", silent = true },
    { "<leader>ff", ":Pick files<cr>", desc = "Mini Files", silent = true },
    { "<leader>fw", ":Pick grep_live<cr>", desc = "Mini Grep", silent = true },
    { "<leader>fb", ":Pick buffers<cr>", desc = "Mini Buffers", silent = true },
    { "<leader>fk", ":Pick keymaps<cr>", desc = "Mini Keymaps", silent = true },

    { "<leader>e", ":lua MiniFiles.open()<cr>", desc = "Mini Files", silent = true },
    { "<leader>x", ":lua MiniBufremove.delete()<cr>", desc = "Mini MiniBufRemove", silent = true },

    { "<leader>da", ":Pick diagnostic<cr>", desc = "Mini Diagnostic All", silent = true },
    { "<leader>dc", ":Pick diagnostic scope='current'<cr>", desc = "Mini Diagnostic Buffer", silent = true },
    { "<leader>fd", ":Pick lsp scope='definition'<cr>", desc = "Mini Lsp Definition", silent = true },
    { "<leader>fD", ":Pick lsp scope='declaration'<cr>", desc = "Mini Lsp Declaration", silent = true },
    { "<leader>fr", ":Pick lsp scope='references'<cr>", desc = "Mini Lsp References", silent = true },
    {
      "<leader>fc",
      function()
        require("mini.extra").pickers.explorer({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Mini Config File",
    },
  },
}
