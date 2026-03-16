return {
  "ludovicchabant/vim-gutentags",
  event = { "BufReadPost", "BufNewFile" }, -- 延迟加载：打开文件时才加载插件
  config = function()
    -- 1. 定义项目根目录标志
    vim.g.gutentags_project_root = { ".git", "Makefile", "CMakeLists.txt", "compile_commands.json" }

    -- 2. 生成的 tags 文件名
    vim.g.gutentags_ctags_tagfile = ".tags"

    -- 3. 将所有的 tags 文件集中管理，避免污染项目目录
    vim.g.gutentags_cache_dir = vim.fn.stdpath("cache") .. "/ctags"

    -- 4. 配置 Universal Ctags 的高级参数 (针对 C/C++ 和嵌入式汇编优化)
    vim.g.gutentags_ctags_extra_args = {
      "--fields=+niazS", -- 附加更多符号信息（如继承关系、访问权限）
      "--extras=+q", -- Universal Ctags 语法：为类成员生成全名 tags
      "--kinds-c++=+p", -- Universal Ctags 语法：包含 C++ 函数原型
      "--kinds-c=+p", -- 包含 C 语言的函数原型声明
      "--kinds-c=+d", -- 索引 C 语言的 #define 宏
      "--kinds-c++=+d", -- 索引 C++ 的 #define 宏
      "--kinds-asm=+h", -- 包含汇编语言的头文件（对底层开发很有用）
      "--output-format=e-ctags", -- 强制输出格式兼容
    }

    -- 5. 如果缓存目录不存在，则自动创建
    if vim.fn.isdirectory(vim.g.gutentags_cache_dir) == 0 then
      vim.fn.mkdir(vim.g.gutentags_cache_dir, "p")
    end

    -- 6. 可选：禁用某些不需要生成 tags 的超大目录
    vim.g.gutentags_exclude_project_root = { "/usr/local", "/opt", "/var" }
  end,
}
