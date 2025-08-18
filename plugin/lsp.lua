-- ~/.config/nvim-new/plugin/lsp.lua
vim.lsp.enable({
  "gopls",
  "lua_ls",
  "ts_ls",
  "rust-analyzer",
  "kotlin-lsp",
})
vim.diagnostic.config({ virtual_text = true })
