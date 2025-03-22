-- mason.lua
local mason_status, mason = pcall(require, "mason")
if not mason_status then
 vim.notify("没有找到 mason")
 return
end

local nlsp_status, nvlsp = pcall(require, "lspconfig")
if not nlsp_status then
 vim.notify("没有找到 lspconfig")
 return
end

-- mason config
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
    }
  }
})

-- 快捷键
local keymap = vim.keymap

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  -- rename
  keymap.set("n", "<leader>r", ":lua vim.lsp.buf.rename<CR>", opts)
  -- code action
  keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
  -- go to definition
  keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  -- show hover
  keymap.set("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
  -- format
  keymap.set("n", "<leader>=", ":lua vim.lsp.buf.format { async = true }<CR>", opts)
end

-- lsp 配置
--  --> lua
nvlsp.lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. "~/.config/nvim/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        },
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end,
  on_attach = on_attach,
})
