-- 主键
vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- --

-- ---------- 普通模式 ---------- --
keymap.set("n", ";", ":")
keymap.set("n", "J", "5j")
keymap.set("n", "K", "5k")

-- ---------- 视觉模式 ---------- --
-- 单行或多行移动
keymap.set("v", "mj", ":m '>+1<CR>gv=gv")
keymap.set("v", "mk", ":m '<-2<CR>gv=gv")
