return {
  {
    "nvim-mini/mini.comment",
    opts = {
      options = {
        -- 这里的自定义函数会覆盖所有默认逻辑
        custom_commentstring = function()
          if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
            return "/* %s */"
          end
        end,
      },
    },
  },
}
