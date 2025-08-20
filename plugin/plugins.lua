local plugins = {
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason.org/mason-lspconfig.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/mrcjkb/rustaceanvim", version = "v6.8.0" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/ptdewey/pendulum-nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate", lazy = false },
	{ src = "https://github.com/folke/snacks.nvim", lazy = false },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-java/lua-async-await" },
	{ src = "https://github.com/nvim-java/nvim-java-refactor" },
	{ src = "https://github.com/nvim-java/nvim-java-core" },
	{ src = "https://github.com/nvim-java/nvim-java-test" },
	{ src = "https://github.com/nvim-java/nvim-java-dap" },
	{ src = "https://github.com/javahello/spring-boot.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-java/nvim-java" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/zapling/mason-conform.nvim" },
}

vim.pack.add({})
for _, plugin in ipairs(plugins) do
	vim.pack.add({
		{ src = plugin.src, version = plugin.version, build = plugin.build, lazy = plugin.lazy },
	})
end

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "kotlin_lsp", "lemminx" },
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

require("fidget").setup({})

require("pendulum").setup({})

require("mini.statusline").setup({ use_icons = vim.g.have_nerd_font })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt", lsp_format = "fallback" },
	},
})

require("nvim-treesitter").setup()

require("nvim-treesitter.configs").setup({
	ensure_installed = { "rust", "lua", "xml" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

require("snacks").setup({
	indent = {
		enabled = true,
	},
	input = { enabled = true, override = true },
	lazygit = { enabled = true },
	picker = { enabled = true },
})

require("java").setup({})
require("lspconfig").jdtls.setup({})

require("mason-conform").setup({})

local dap = require("dap")

dap.configurations.scala = {
	{
		type = "scala",
		request = "launch",
		name = "Run or test with input",
		metals = {
			runType = "runOrTestFile",
			args = function()
				local args_string = vim.fn.input("Arguments: ")
				return vim.split(args_string, " +")
			end,
		},
	},
	{
		type = "scala",
		request = "launch",
		name = "Run or Test",
		metals = {
			runType = "runOrTestFile",
		},
	},
	{
		type = "scala",
		request = "launch",
		name = "Test Target",
		metals = {
			runType = "testTarget",
		},
	},
}

require("metals").setup_dap()

dap.listeners.after.event_initialized["auto-repl"] = function()
	dap.repl.open()
end
