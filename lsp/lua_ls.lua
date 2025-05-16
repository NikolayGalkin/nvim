local Lsp = require("utils.lsp")
-- vim.lsp.config("lua_ls", {
--   on_init = function(client)
--     if client.workspace_folders then
--       local path = client.workspace_folders[1].name
--       if
--         path ~= vim.fn.stdpath("config")
--         and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
--       then
--         return
--       end
--     end
--
--     client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
--       runtime = {
--         version = "LuaJIT",
--         path = {
--           "lua/?.lua",
--           "lua/?/init.lua",
--         },
--       },
--       workspace = {
--         checkThirdParty = false,
--         library = {
--           vim.env.VIMRUNTIME,
--           -- Depending on the usage, you might want to add additional paths
--           -- here.
--           -- '${3rd}/luv/library'
--           -- '${3rd}/busted/library'
--         },
--       },
--     })
--   end,
-- })

return {
  cmd = { "lua-language-server" },
  on_attach = Lsp.on_attach,
  filetypes = { "lua" },
  root_markers = {
    ".luacheckrc",
    ".luarc.json",
    ".luarc.jsonc",
    ".stylua.toml",
    "selene.toml",
    "selene.yml",
    "stylua.toml",
  },
  single_file_support = true,
  settings = {
    Lua = {
      hint = {
        enable = true,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
