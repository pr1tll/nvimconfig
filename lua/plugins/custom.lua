return {
  { "preservim/nerdcommenter", lazy = false },
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    "RaafatTurki/hex.nvim",
    cmd = "HexNvim",

    config = function()
      -- defaults
      require "configs.hexnvim"
    end,
  },
}
