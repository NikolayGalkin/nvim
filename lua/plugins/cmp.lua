return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "moyiz/blink-emoji.nvim",
  },
  event = { "InsertEnter", "CmdlineEnter" },
  build = "cargo build --release",
  -- version = "*",

  opts = {
    signature = { enabled = true },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },

    sources = {
      default = { "lazydev", "lsp", "snippets", "path", "buffer", "cmdline", "emoji" },
      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- the higher the number, the higher the priority
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        },
        cmdline = {
          min_keyword_length = 2,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },

    keymap = {
      preset = "enter",
      ["<tab>"] = { "select_next", "fallback" },
      ["<s-tab>"] = { "select_prev", "fallback" },
      ["<c-j>"] = { "select_next", "fallback" },
      ["<c-k>"] = { "select_prev", "fallback" },
    },

    cmdline = {
      enabled = true,
      completion = {
        -- preselect = false,
        -- auto_insert = false,
        ghost_text = {
          enabled = true,
        },
        menu = {
          auto_show = true,
        },
      },
      keymap = {
        preset = "inherit",
        ["<CR>"] = { "select_and_accept", "fallback" },
      },
    },

    completion = {
      -- list = {
      --   selection = {
      --     preselect = false,
      --     auto_insert = false,
      --   },
      -- },
      menu = {
        scrolloff = 1,
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
            { "source_name" },
          },
        },
      },
      documentation = {
        auto_show = true,
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    -- fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
  config = function(_, opts)
    require("blink.cmp").setup(opts)

    local capabilities = require("blink.cmp").get_lsp_capabilities({}, true)
    vim.lsp.config("*", {
      capabilities = capabilities,
    })
  end,
}
