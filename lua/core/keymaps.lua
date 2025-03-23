-- 主键
vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }

local nmappings = {
  -- 功能性设置
  { from = ";",           to = ":" },
  { from = "<leader>nh",  to = ":nohl<CR>" }, -- 取消高亮

  -- 移动
  { from = "<C-h>",       to = "<C-w>h" },
  { from = "<C-j>",       to = "<C-w>j" },
  { from = "<C-k>",       to = "<C-w>k" },
  { from = "<C-l>",       to = "<C-w>l" },
  { from = "J",           to = "5j",                    mode = mode_nv },
  { from = "K",           to = "5k",                    mode = mode_nv },

  -- 移动单行或多行
  { from = "mj",          to = ":m '>+1<CR>gv=gv",      mode = mode_v  },
  { from = "mk",          to = ":m '<-2<CR>gv=gv",      mode = mode_v  },
}

for _, mapping in ipairs(nmappings) do
  vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

