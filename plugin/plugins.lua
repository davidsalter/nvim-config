vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup({})

vim.pack.add({
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "kotlin_lsp" }
})

vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({

	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<CR>"] = { "select_and_accept", "fallback" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
	},

	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},

	sources = { default = { "lsp" } },
})

vim.pack.add({
	{ src = "https://github.com/mrcjkb/rustaceanvim", version = "v6.7.0" },
})

vim.pack.add({
	{ src = "https://github.com/j-hui/fidget.nvim" },
})

require("fidget").setup({})

vim.pack.add({
	{ src = "https://github.com/ptdewey/pendulum-nvim" },
})

require("pendulum").setup({})

vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.nvim" },
})

require("mini.statusline").setup({ use_icons = vim.g.have_nerd_font })

vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt", lsp_format = "fallback" },
	},
})

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "rust", "lua" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
vim.pack.add({
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
})

vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim", lazy = false },
})

require("snacks").setup({
	indent = {
		enabled = true,
	},
	input = { enabled = true, override = true },
	lazygit = { enabled = true },
	picker = { enabled = true },
})

vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }
})


 -- Java
vim.pack.add{
  { src = 'https://github.com/mason-org/mason.nvim' },
}

vim.pack.add{
  { src = 'https://github.com/nvim-java/lua-async-await' },
}

vim.pack.add{
  { src = 'https://github.com/nvim-java/nvim-java-refactor' },
}

vim.pack.add{
  { src = 'https://github.com/nvim-java/nvim-java-core' },
}

vim.pack.add{
  { src = 'https://github.com/nvim-java/nvim-java-test' },
}

vim.pack.add{
  { src = 'https://github.com/nvim-java/nvim-java-dap' },
}

vim.pack.add{
  { src = 'https://github.com/mfussenegger/nvim-dap' },
}

vim.pack.add{
  { src = 'https://github.com/javahello/spring-boot.nvim' },
}

vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

vim.pack.add({
  { src = "https://github.com/nvim-java/nvim-java" },
})

require("java").setup({})
require('lspconfig').jdtls.setup({})
