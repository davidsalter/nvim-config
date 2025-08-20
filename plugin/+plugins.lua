-- ~/.config/nvim-new/plugin/plugins.lua
vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
}, { load = true })

require("gitsigns").setup({ signcolumn = false })

vim.pack.add({
	"https://github.com/catppuccin/nvim",
})

vim.pack.add({
	{ src = "https://github.com/scalameta/nvim-metals" },
})

vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
})
