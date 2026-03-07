-- ./lua/configs/lspconfig.lua
--local lspconfig = require "lspconfig"
--local nvlsp = require "nvchad.lsp"

--local pid = vim.fn.getpid()

---- 1. Define/Update the configuration using the native API
--vim.lsp.config('omnisharp', {
  --cmd = { "omnisharp-mono", "--languageserver", "--hostPID", tostring(pid) },
  --on_attach = nvlsp.on_attach,
  --on_init = nvlsp.on_init,
  --capabilities = nvlsp.capabilities,
--})

---- 2. Enable the server (activates it for the relevant filetypes)
--vim.lsp.enable('omnisharp')
--- lua/configs/lspconfig.lua
-- lua/configs/lspconfig.lua
-- -- lua/configs/lspconfig.lua

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- ==========================================
-- C# (OmniSharp) 的最新原生写法
-- ==========================================
vim.lsp.config('omnisharp', {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  
  -- 把你之前的高级设置直接无缝粘贴在这里：
  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = true,
      OrganizeImports = true,
    },
    RoslynExtensionsOptions = {
      EnableAnalyzersSupport = true,
      EnableImportCompletion = true,
      AnalyzeOpenDocumentsOnly = false,
    },
    Sdk = {
      IncludePrereleases = true,
    },
  },
})

-- 启动它！
vim.lsp.enable('omnisharp')
