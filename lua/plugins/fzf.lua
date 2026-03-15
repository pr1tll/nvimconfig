return {
  -- 禁用 fzf-lua 中的 git 相关快捷键
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- 禁用 \fg (Find Git Files)
      { "<leader>fg", false },
      -- 顺便禁用可能让你困扰的其他 git 快捷键
      { "<leader>gc", false }, -- git commits
      { "<leader>gs", false }, -- git status
    },
  },
}
