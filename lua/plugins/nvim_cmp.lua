return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    -- 1. 关闭自动弹出
    opts.completion = {
      autocomplete = false, -- 关键设置：设为 false 后，打字时不会自动跳出补全框
    }

    -- 2. 设置手动触发的快捷键 (例如 Ctrl + 空格)
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<C-p>"] = cmp.mapping.complete(), -- 按下 Ctrl + Space 弹出补全菜单
    })
  end,
}
