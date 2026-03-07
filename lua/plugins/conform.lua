-- lua/plugins/format.lua
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- 只有在保存前或手动调用时加载，优化启动速度
  cmd = { "ConformInfo" }, -- 输入命令时加载
  keys = {
    {
      -- 你的 F4 快捷键绑定在这里
      "<F4>",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "n",
      desc = "Format buffer",
    },
  },
  opts = {
    -- 具体的格式化配置写在这里
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      lua = { "stylua" },
      python = { "isort", "black" },
    },
    -- -- 2. 详细配置具体的格式化器参数
    formatters = {
      ["clang-format"] = {
        -- prepend_args 会被添加到默认命令参数之前
        -- "-style=file" 告诉它向上递归寻找 .clang-format 文件
        -- "--fallback-style=LLVM" 找不到配置文件时的保底方案
        prepend_args = { "-style=file", "--fallback-style=LLVM" },
      },
    },
    --如果你想开启保存自动格式化，取消下面的注释
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
}
