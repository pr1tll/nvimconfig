return {
  {
    "saghen/blink.cmp",
    opts = {
      -- cmdline = {
      --   enabled = true, -- 保持开启，为了让冒号 (:) 命令还能补全
      --   sources = function()
      --     local type = vim.fn.getcmdtype()
      --
      --     -- 核心：只要是 / 搜索，立刻让它滚蛋，返回空列表！
      --     -- 这样它就没东西可补全，那个迷路的标签也永远不会画出来了。
      --     if type == "/" or type == "?" then
      --       return {}
      --     end
      --
      --     -- 保留正常的 : 命令补全
      --     if type == ":" then
      --       return { "cmdline" }
      --     end
      --
      --     return {}
      --   end,
      -- },
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
        ["<C-p>"] = { "show", "show_documentation", "hide_documentation" },
        -- 修改回车逻辑：
        -- ["<CR>"] = {
        --   function(cmp)
        --     -- 核心判断：只有菜单可见时，才执行 accept
        --     if cmp.is_visible() then
        --       return cmp.accept()
        --     end
        --   end,
        --   "fallback", -- 菜单不可见，或者 accept 失败，都会执行这个原生换行
        -- },
      },

      -- 禁用动画，追求你之前的瞬间位移感
      appearance = {
        highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
      },
    },
  },
}
--
-- return {
--   {
--     "saghen/blink.cmp",
--     opts = {
--       completion = {
--         -- 1. 核心修复：禁用补全菜单的自动渲染
--         menu = {
--           auto_show = false,
--
--           -- 【新增】在补全菜单最左侧画出 1, 2, 3... 的数字提示，做到所见即所得
--           draw = {
--             columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
--             components = {
--               item_idx = {
--                 text = function(ctx) return ctx.idx and tostring(ctx.idx) or "" end,
--                 highlight = 'Number', -- 使用系统默认的数字高亮色，醒目
--               }
--             }
--           }
--         },
--
--         -- 2. 深度封杀：禁止打字和特殊符号唤醒补全
--         trigger = {
--           show_on_keyword = false,
--           show_on_trigger_character = false,
--         },
--
--         -- 3. 视野清理：禁用文档说明的自动弹出，只有你按 C-Space 才会显示
--         documentation = {
--           auto_show = false,
--         },
--       },
--
--       -- 快捷键配置保持你的逻辑：全手动接管
--       keymap = {
--         preset = "default",
--         ["<C-p>"] = { "show", "show_documentation", "hide_documentation" },
--         ["<CR>"] = { "accept", "fallback" },
--
--         -- 【新增】单键数字直接上屏。
--         -- 注意后面的 'fallback' 非常关键：它保证了在菜单未开启时，你按数字键就是正常打字输入。
--         ['1'] = { function(cmp) cmp.accept({ index = 1 }) end, 'fallback' },
--         ['2'] = { function(cmp) cmp.accept({ index = 2 }) end, 'fallback' },
--         ['3'] = { function(cmp) cmp.accept({ index = 3 }) end, 'fallback' },
--         ['4'] = { function(cmp) cmp.accept({ index = 4 }) end, 'fallback' },
--         ['5'] = { function(cmp) cmp.accept({ index = 5 }) end, 'fallback' },
--         ['6'] = { function(cmp) cmp.accept({ index = 6 }) end, 'fallback' },
--         ['7'] = { function(cmp) cmp.accept({ index = 7 }) end, 'fallback' },
--         ['8'] = { function(cmp) cmp.accept({ index = 8 }) end, 'fallback' },
--         ['9'] = { function(cmp) cmp.accept({ index = 9 }) end, 'fallback' },
--       },
--
--       -- 禁用动画，追求瞬间位移感
--       appearance = {
--         highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
--       },
--     },
--   },
-- }
