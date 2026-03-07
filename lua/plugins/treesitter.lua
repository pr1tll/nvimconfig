return {
  "nvim-treesitter/nvim-treesitter",
  -- Use 'opts' to extend LazyVim's defaults instead of overwriting them with 'config'
  --enabled = false,
  opts = {
    ensure_installed = {
      "c",
      "cpp",
      "lua",
      "vim",
    },
    highlight = {
      enable = true, -- 这行开启真正的语义高亮
    },
  },
}
