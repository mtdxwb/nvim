-- 主键
vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }

-- telescope
local builtin = require('telescope.builtin')

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

  -- telescope
  { from = "<leader>ff",  to = builtin.find_files,      opts = { desc = 'Telescope find files' } },
  { from = "<leader>fg",  to = builtin.live_grep,       opts = { desc = 'Telescope live grep'  } },
  { from = "<leader>fb",  to = builtin.buffers,         opts = { desc = 'Telescope buffers'    } },
  { from = "<leader>fh",  to = builtin.help_tags,       opts = { desc = 'Telescope help tags'  } },
}

for _, mapping in ipairs(nmappings) do
  vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to,  mapping.opts or { noremap = true })
end

