return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter' },
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        dependencies = 'rafamadriz/friendly-snippets',
        -- version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = 'make install_jsregexp',
        -- opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
      },
      {
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'onsails/lspkind.nvim', -- vs-code like pictograms
        'hrsh7th/cmp-nvim-lua',
      },
    },
    config = function()
      local cmp = require 'cmp'
      local lspkind = require 'lspkind'
      local luasnip = require 'luasnip'

      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup {
        completion = {
          completeopt = 'menu,menuone,preview,noselect',
        },

        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ['<c-b>'] = cmp.mapping.scroll_docs(-4),
          ['<c-f>'] = cmp.mapping.scroll_docs(4),
          ['<c-Space>'] = cmp.mapping.complete(),
          ['<esc>'] = cmp.mapping.abort(),
          ['<cr>'] = cmp.mapping.confirm { select = false }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          -- ['<tab>'] = cmp.mapping.select_next_item(),
          -- ['<s-tab>'] = cmp.mapping.select_prev_item(),
          ['<tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<s-tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.expand_or_locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        view = {
          entries = {
            follow_cursor = true,
          },
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'nvim_lua' },
          { name = 'buffer' }, -- For luasnip users.
          { name = 'path' }, -- For luasnip users.
        },
        -- configure lspkind for vs-code like pictograms in completion menu
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = lspkind.cmp_format {
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
            menu = {
              buffer = '[buf]',
              nvim_lsp = '[lsp]',
              luasnip = '[snp]',
              nvim_lua = '[lua]',
            },
          },
        },
      }
    end,
  },
}
