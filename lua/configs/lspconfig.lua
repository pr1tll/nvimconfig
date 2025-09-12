-- ./lua/configs/lspconfig.lua
local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.lsp"

local pid = vim.fn.getpid()

lspconfig.omnisharp.setup({
  cmd = { "omnisharp-mono", "--languageserver", "--hostPID", tostring(pid) },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})
