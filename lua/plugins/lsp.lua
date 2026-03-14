return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- 显式关闭 inlay_hints 的默认开启状态
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
