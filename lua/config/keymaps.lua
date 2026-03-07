-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--print("--- KEYMAPS.LUA 已成功加载 ---")
--print("当前内存中的 Leader 是: '" .. (vim.g.mapleader or "NIL") .. "'")

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
-- -- 映射 Alt + 1-9 到对应的 buffer
for i = 1, 9 do
  vim.keymap.set("n", "<A-" .. i .. ">", function()
    require("bufferline").go_to(i, true)
  end, { silent = true, desc = "Go to buffer " .. i })
end
-- Alt + l 切换到下一个 Buffer
vim.keymap.set("n", "<A-l>", ":bnext<CR>")
-- Alt + h 切换到上一个 Buffer
vim.keymap.set("n", "<A-h>", ":bprevious<CR>")
--- 插入模式下的 HJKL 移动（手不离主键盘区）
local map = vim.keymap.set
-- CTRL-H：向左移 (在插入模式下通常模拟 Backspace 或左移)
-- 注意：有些终端会把 CTRL-H 识别为退格，如果想单纯左移可以用 <Left>
map("i", "<C-H>", "<Left>", { noremap = true, desc = "Move left" })
-- CTRL-J：向下移
map("i", "<C-J>", "<Down>", { noremap = true, desc = "Move down" })
-- CTRL-K：向上移
map("i", "<C-K>", "<Up>", { noremap = true, desc = "Move up" })
-- CTRL-L：向右移 (也就是你用来跳出括号的操作)
map("i", "<C-L>", "<Right>", { noremap = true, desc = "Move right" })

vim.keymap.set("n", "<F3>", function()
  -- 1. 记录当前位置到跳转表 (Jumplist)，方便用 Ctrl-O 跳回
  vim.cmd("normal! m'")

  vim.cmd("normal! $")
  -- 2. 执行搜索：/error:
  -- 'wn' 参数表示：w (允许回绕文件), n (不移动光标，仅探测)
  local search_res = vim.fn.search("error:", "W")

  if search_res ~= 0 then
    -- 3. 瞬间位移到目标行并执行 '0' (回到行首)
    -- 注意：这里不使用 zz，所以页面不会自动居中
    vim.cmd("normal! 0")
  else
    vim.notify("未发现 'error:' 字符串", vim.log.levels.WARN)
  end
end, { desc = "跳转到下一个 error: 并定位到行首" })

-- lua/config/keymaps.lua

-- 命令行模式 (c 模式)
-- 映射 Ctrl-k 为向上翻历史 (匹配已输入的前缀)
vim.keymap.set("c", "<C-k>", "<Up>", { desc = "上一条命令历史" })

-- 映射 Ctrl-j 为向下翻历史 (匹配已输入的前缀)
vim.keymap.set("c", "<C-j>", "<Down>", { desc = "下一条命令历史" })
