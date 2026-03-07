return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 10000, -- 单位是毫秒，这里设置 3 秒后自动消失
    background_colour = "#000000", -- 可选：设置背景色
    render = "compact", -- 可选：显示模式（default, gpt, compact, minimal）
    stages = "fade", -- 可选：动画效果
  },
}
