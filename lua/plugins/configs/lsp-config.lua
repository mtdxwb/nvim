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
  keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>", opts)
  -- go to definition
  keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- show hover
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  -- format
  keymap.set("n", "<leader>=", ":lua vim.lsp.buf.format { async = true }<CR>", opts)

  -- 以浮窗形式显示错误
  keymap.set("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap.set("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  keymap.set("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
end

-- blink
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- 对错误警告的图标
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  -- 在输入模式下也更新提示，设置为 true 也许会影响性能
  update_in_insert = false,
})
local signs = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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
  capabilities = capabilities,
})
