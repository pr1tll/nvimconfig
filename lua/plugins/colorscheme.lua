--return {
---- add gruvbox
--{ "shaunsingh/nord.nvim" },

---- Configure LazyVim to load gruvbox
--{
--"LazyVim/LazyVim",
--opts = {
--colorscheme = "nord",
--},
--}
--}

return {
  "tanvirtin/monokai.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai").setup({})
  end,
}
