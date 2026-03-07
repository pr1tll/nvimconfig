require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local builtin = require "telescope.builtin"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<F8>", "<ESC>A;<CR>")
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

map("n", "<F4>", function()
  require("conform").format { async = true, lsp_fallback = true }
end)

-- ====================
-- Bufferline
-- ====================
-- 映射 Alt + 1-9 到对应的 buffer
for i = 1, 9 do
  map("n", "<A-" .. i .. ">", function()
    require("bufferline").go_to(i, true)
  end, { silent = true, desc = "Go to buffer " .. i })
end

-- Alt + l 切换到下一个 Buffer / Alt + h 切换到上一个 Buffer
map("n", "<A-l>", ":bnext<CR>", { silent = true, desc = "Next Buffer" })
map("n", "<A-h>", ":bprevious<CR>", { silent = true, desc = "Previous Buffer" })

-- ====================
-- Insert Mode Movement
-- ====================
-- CTRL-H：向左移
map("i", "<C-H>", "<Left>", { noremap = true, desc = "Move left" })
-- CTRL-J：向下移
map("i", "<C-J>", "<Down>", { noremap = true, desc = "Move down" })
-- CTRL-K：向上移
map("i", "<C-K>", "<Up>", { noremap = true, desc = "Move up" })
-- CTRL-L：向右移 (跳出括号)
map("i", "<C-L>", "<Right>", { noremap = true, desc = "Move right" })

-- ====================
-- Neo-tree
-- ====================
--map("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, desc = "Toggle Neo-tree" })
