require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- File: ~/.config/nvim/lua/config/options.lua

vim.o.exrc = true
vim.o.background = "dark" -- or "light" for light mode

vim.opt.clipboard = "unnamedplus"

-- Indentation settings
vim.opt.autoindent = true   -- 继承上一行的缩进
vim.opt.expandtab = true    -- 将制表符转换为空格
vim.opt.shiftwidth = 8      -- 每一级缩进的空格数
vim.opt.tabstop = 8         -- 一个 [Tab] 字符占据的等效空格数
vim.opt.softtabstop = 8     -- 编辑模式下按退格键时，删除 8 个空格

-- Buffer and UI settings
vim.opt.hidden = true       -- 允许后台存在多个缓冲区
vim.opt.showtabline = 2     -- 即使只有一个 buffer 也要显示顶部工具栏
