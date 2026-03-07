return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons", -- 用于显示漂亮的图标
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- 使用 buffer 模式
          numbers = "ordinal", -- 重要：显示序号 (1, 2, 3...)，方便 Alt+数字 跳转
          diagnostics = "nvim_lsp", -- 如果你有 LSP，标签上会直接显示报错图标
          separator_style = "slant", -- 标签样式：倾斜、圆角或厚实
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
          },
        },
      })
    end,
  },
}
