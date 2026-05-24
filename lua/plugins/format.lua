local conform = require('conform')

local function has_file(names)
  return function(ctx)
    return vim.fs.root(ctx.filename, names) ~= nil
  end
end

conform.setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },

  formatters_by_ft = {
    lua = { 'stylua' },
    json = { 'biome', 'jq' },
    python = { 'black' },
    javascript = { 'biome', 'prettier' },
    typescript = { 'biome', 'prettier' },
    javascriptreact = { 'biome', 'prettier' },
    typescriptreact = { 'biome', 'prettier' },
    css = { 'prettier' },
    html = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
    toml = { 'taplo' },
  },
  formatters = {
    prettier = {
      condition = has_file({
        '.prettierrc',
        '.prettierrc.json',
        '.prettierrc.yml',
        '.prettierrc.yaml',
        '.prettierrc.toml',
        '.prettierrc.js',
        '.prettierrc.cjs',
        '.prettierrc.mjs',
        '.prettierrc.ts',
        'prettier.config.js',
        'prettier.config.ts',
        'prettier.config.cjs',
        'prettier.config.mjs',
        'prettier.config.cts',
        'prettier.config.mts',
      }),
    },

    black = {
      condition = has_file({
        'black.toml',
        '.black',
      }),
    },

    biome = {
      condition = has_file({
        'biome.json',
        'biome.jsonc',
      }),
    },
  },
})
