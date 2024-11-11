local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>ih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, bufopts)
end

return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      opts = {
        ui = {
          border = "rounded",
        },
      },
    },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  init = function()
    vim.diagnostic.config({
      float = { source = "if_many", border = "rounded" },
    })
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
  config = function()
    require("mason").setup({})

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "basedpyright", "ruff", "ts_ls", "vtsls", "jsonls", "nil_ls" },
    })

    require("mason-tool-installer").setup({
      ensure_installed = { "luacheck", "stylua", "ruff", "mypy", "prettierd", "eslint_d", "nixpkgs-fmt" },
    })

    local lsp = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lsp.basedpyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lsp.nil_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lsp.ruff.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lsp.ts_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lsp.vtsls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lsp.jsonls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lsp.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        })
      end,
      settings = {
        Lua = {
          hint = {
            enable = true,
            setType = true,
          },
          diagnostics = {
            globals = { "vim" },
          },
          workleader = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
