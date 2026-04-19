-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Force LSP enum members to use the 'Constant' highlight color
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     --vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { link = "Constant" })
--     --vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = "#4ec9b0" })
--
--     local green = { fg = "#4ec9b0", force = true }
--     -- Target the general token
--     vim.api.nvim_set_hl(0, "@lsp.type.enumMember", green)
--
--     -- Explicitly target the C and C++ specific tokens to override the theme
--     vim.api.nvim_set_hl(0, "@lsp.type.enumMember.c", green)
--     vim.api.nvim_set_hl(0, "@lsp.type.enumMember.cpp", green)
--   end,
-- })
--
-- Use LspAttach to clear tagfunc (removes LSP interference with tags)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].tagfunc = ""
  end,
})

-- Force block comments for C/C++ files
vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  -- Note: We removed "h" because headers are detected as "c" or "cpp"
  pattern = { "c", "cpp" },
  callback = function()
    -- Use opt_local to force the setting for the current buffer
    vim.opt_local.commentstring = "/* %s */"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})
