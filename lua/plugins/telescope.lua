return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/flash.nvim",
  },
  opts = function(_, opts)
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function flash_jump(prompt_bufnr)
      require("flash").jump({
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
          mode = "search",
          exclude = {
            function(win)
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
            end,
          },
        },
        action = function(match)
          local picker = action_state.get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      })
    end

    -- Extend the options with both defaults and specific pickers
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      scroll_strategy = "limit", -- 避免滚动到尽头时循环回顶部，方便快速连续翻页
      preview = { treesitter = false },
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = { preview_width = 0.4, results_width = 0.6 },
        width = 0.95,
        height = 0.85,
      },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-s>"] = flash_jump,
          -- 快速翻页映射
          ["<C-u>"] = actions.results_scrolling_up,
          ["<C-d>"] = actions.results_scrolling_down,
          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,
          ["<C-s>"] = flash_jump,
        },
        n = {
          ["s"] = flash_jump,
        },
      },
    })

    -- Add your picker-specific settings here
    opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
      live_grep = {
        path_display = { "smart" },
      },
      find_files = {
        previewer = true,
      },
    })
  end,
}
