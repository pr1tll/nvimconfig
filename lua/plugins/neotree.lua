return {
  -- ... other plugins ...

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    opts = {
      window = {
        mappings = {
          ["/"] = "noop", -- Swap out if you want silent highlight searching instead
        },
      },
    },
  },
}
