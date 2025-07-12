return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  opts = function()
    local ai = require("mini.ai")
    return {
      ai = {
        custom_textobjects = {
          o = ai.gen_spec.treesitter({ -- code block
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
        },
      },
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
          left = "<S-h>",
          right = "<S-l>",
          down = "<S-j>",
          up = "<S-k>",

          -- line_left = "<S-h>",
          -- line_right = "<S-l>",
          -- line_down = "<S-j>",
          -- line_up = "<S-k>",
        },
      },
      notify = {
        window = {
          winblend = 0,
        },
      },
      pairs = {
        mappings = {
          ["<"] = { action = "closeopen", pair = "<>", neigh_pattern = "[^\\].", register = { cr = false } },
        },
      },
      pick = {
        use_cache = true,
        mappings = {
          move_down = "<c-j>",
          move_up = "<c-k>",
        },
      },
    }
  end,
  config = function(_, opts)
    require("mini.basics").setup(opts.basics)
    require("mini.ai").setup(opts.ai)
    require("mini.animate").setup()
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
    require("mini.pairs").setup(opts.pairs)
    require("mini.splitjoin").setup()
    require("mini.statusline").setup()
    require("mini.surround").setup()

    local MiniNotify = require("mini.notify")
    MiniNotify.setup(opts.notify)
    vim.notify = MiniNotify.make_notify()

    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })

    local MiniPick = require("mini.pick")
    MiniPick.setup(opts.pick)
    vim.ui.select = MiniPick.ui_select

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
    { "<leader>ll", ":Lazy<cr>", desc = "Lazy Help", silent = true },
    { "<leader>fh", ":Pick help<cr>", desc = "Mini Help", silent = true },
    {
      "<leader>ff",
      function()
        MiniPick.builtin.cli({
          command = { "fd", "--hidden", "--type", "f", "--type", "d", "--exclude", ".git" },
        })
      end,
      desc = "Mini Files",
      silent = true,
    },

    { "<leader>fw", ":Pick grep_live<cr>", desc = "Mini Grep", silent = true },
    { "<leader>fb", ":Pick buffers<cr>", desc = "Mini Buffers", silent = true },
    { "<leader>fk", ":Pick keymaps<cr>", desc = "Mini Keymaps", silent = true },

    { "<leader>e", ":lua MiniFiles.open()<cr>", desc = "Mini Files", silent = true },
    { "<leader>x", ":lua MiniBufremove.delete()<cr>", desc = "Mini MiniBufRemove", silent = true },
    { "<leader>w", ":w<cr>", { desc = "save File", silent = true } },
    { "<leader>q", ":qa!<cr>", { desc = "Quit Vim", silent = true } },
    { "<leader>t", ":term<cr>", { desc = "Terminal Buffer", silent = true } },
    {
      "<leader>ih",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end,
      { desc = "Terminal Buffer", silent = true },
    },
    { "<leader>cD", ":Pick diagnostic<cr>", desc = "Mini Diagnostic All", silent = true },
    { "<leader>cd", ":Pick diagnostic scope='current'<cr>", desc = "Mini Diagnostic Buffer", silent = true },
    { "gd", ":Pick lsp scope='definition'<cr>", desc = "Mini Lsp Definition", silent = true },
    { "gD", ":Pick lsp scope='declaration'<cr>", desc = "Mini Lsp Declaration", silent = true },
    { "gr", ":Pick lsp scope='references'<cr>", desc = "Mini Lsp References", silent = true },
    { "gi", ":Pick lsp scope='implementation'<cr>", desc = "Mini Lsp Implementation", silent = true },
    {
      "<leader>fc",
      function()
        require("mini.extra").pickers.explorer({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Mini Config File",
    },
  },
}
