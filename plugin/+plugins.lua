-- ~/.config/nvim-new/plugin/plugins.lua
vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
}, { load = true })

require("gitsigns").setup({ signcolumn = false })

vim.pack.add({
	"https://github.com/catppuccin/nvim",
})

--require("catppuccin").setup({
--	-- optional configuration here
--})
--
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
