return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        -- 1. 核心修复：禁用补全菜单的自动渲染
        menu = {
          auto_show = false,
        },

        -- 2. 深度封杀：禁止打字和特殊符号（如 C 语言的 -> 和 .）唤醒补全
        trigger = {
          show_on_keyword = false,
          show_on_trigger_character = false,
        },

        -- 3. 视野清理：禁用文档说明的自动弹出，只有你按 C-Space 才会显示
        documentation = {
          auto_show = false,
        },
      },

      -- 快捷键配置保持你的逻辑：全手动接管
      keymap = {
        preset = "default",
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<CR>"] = { "accept", "fallback" },
      },

      -- 禁用动画，追求你之前的瞬间位移感
      appearance = {
        highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
      },
    },
  },
}
