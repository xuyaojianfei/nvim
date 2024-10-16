vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>nv", "<C-W>v")
keymap.set("n", "<leader>ns", "<C-W>s")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- ---------- 插件 ---------- ---
-- 切换buffer
keymap.set("n", "<leader>ni", ":bprevious<CR>")
keymap.set("n", "<leader>no", ":bnext<CR>")
-- 关闭buffer
keymap.set("n", "<leader>x", ":bdelete<CR>")
-- markdown
keymap.set("n", "<leader>m", ":Glow<CR>")
