-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.exrc = true

vim.o.background = "dark" -- or "light" for light mode

vim.g.mapleader = "\\"
-- 1. 允许后台存在多个缓冲区
vim.opt.hidden = true

-- 2. 告诉 Neovim 即使只有一个 buffer 也要显示顶部工具栏
vim.opt.showtabline = 2

vim.opt.clipboard = "unnamedplus"

-- 手动指定使用 xsel 并强制指向 clipboard 选区
vim.g.clipboard = {
  name = "xsel-manual",
  copy = {
    ["+"] = "xsel --clipboard --input",
    ["*"] = "xsel --primary --input",
  },
  paste = {
    ["+"] = "xsel --clipboard --output",
    ["*"] = "xsel --primary --output",
  },
  cache_enabled = 1,
}

vim.opt.autoindent = true -- 继承上一行的缩进
vim.opt.expandtab = true -- 将制表符转换为空格
vim.opt.shiftwidth = 8 -- 每一级缩进的空格数
vim.opt.tabstop = 8 -- 一个 [Tab] 字符占据的等效空格数
vim.opt.softtabstop = 8 -- 编辑模式下按退格键时，删除 4 个空格

-- LazyVim 默认使用 nvim-notify
vim.g.notify_timeout = 10000 -- 设置为 3 秒
