-- lua/configs/telescope_flash.lua

return function(_, opts)
  -- The custom Flash function for Telescope
  local function flash_telescope(prompt_bufnr)
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
        local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        picker:set_selection(match.pos[1] - 1)
      end,
    })
  end

  -- Safely inject the new mappings into NvChad's default Telescope config
  opts.defaults = opts.defaults or {}
  opts.defaults.mappings = opts.defaults.mappings or {}
  opts.defaults.mappings.i = opts.defaults.mappings.i or {}
  opts.defaults.mappings.n = opts.defaults.mappings.n or {}
  
  -- <c-s> in insert mode, 's' in normal mode
  opts.defaults.mappings.i["<c-s>"] = flash_telescope
  opts.defaults.mappings.n["s"] = flash_telescope
end
