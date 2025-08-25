-- ----------------------------------------------
-- Configuration
-- ----------------------------------------------
local opt = vim.opt

opt.colorcolumn = "100" -- Highlight column 80
opt.guicursor = { "i:block-blinkwait175-blinkon150-blinkoff150" }
opt.signcolumn = "yes:1" -- Always show sign column
opt.termguicolors = true -- Enable true colors
opt.ignorecase = true -- Ignore case in search
opt.swapfile = false -- Disable swap files
opt.autoindent = true -- Enable auto indentation
opt.smartindent = true
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces for a tab
opt.softtabstop = 2 -- Number of spaces for a tab when editing
opt.shiftwidth = 2 -- Number of spaces for autoindent
opt.shiftround = true -- Round indent to multiple of shiftwidth
--opt.listchars = "tab: ,multispace:|   ,eol:󰌑" -- Characters to show for tabs, spaces, and end of line
--opt.list = true -- Show whitespace characters
opt.number = true -- Show line numbers
opt.numberwidth = 2 -- Width of the line number column
opt.wrap = false -- Disable line wrapping
opt.cursorline = true -- Highlight the current line
opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer
opt.undofile = true -- Enable persistent undo
opt.completeopt = { "menuone", "popup", "noinsert" } -- Options for completion menu
opt.winborder = "rounded" -- Use rounded borders for windows
opt.hlsearch = true -- Disable highlighting of search results

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅙",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
			[vim.diagnostic.severity.INFO] = "󰋼",
		},
	},
	virtual_text = true, -- show inline messages
	virtual_lines = { current_line = true },
	icons = true,
	underline = true, -- underline problematic text
	update_in_insert = false, -- don't update diagnostics while typing
	severity_sort = true, -- sort diagnostics by severity
})

-- ----------------------------------------------
-- Plugins
-- ----------------------------------------------
vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/scalameta/nvim-metals" },
	{ src = "https://github.com/mason.org/mason-lspconfig.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	--	{ src = "https://github.com/mrcjkb/rustaceanvim", version = "v6.8.0" },
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
})

-- ----------------------------------------------
-- LSP
-- ----------------------------------------------
-- vim.lsp.enable({
-- 	"gopls",
-- 	"lua_ls",
-- 	"ts_ls",
-- 	"rust-analyzer",
-- 	"kotlin-lsp",
-- })
-- vim.diagnostic.config({ virtual_text = true })

-- ----------------------------------------------
-- Setup
-- ----------------------------------------------
require("gitsigns").setup({ signcolumn = false })

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "kotlin_lsp", "lemminx" },
})

require("blink.cmp").setup({

	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},
	completion = {
		list = {
			selection = { preselect = false, auto_insert = true },
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 100,
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

local keymap = vim.keymap.set
local s = { silent = true }
local opts = { noremap = true, silent = true }
local dap = require("dap")

vim.g.mapleader = " "

-- ----------------------------------------------
-- Key Bindings
-- ----------------------------------------------
keymap("n", "<space>", "<Nop>")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s)
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", s)
keymap("n", "<Leader>-", "<cmd>split<CR>", s)
keymap("x", "y", [["+y]], s)
keymap("t", "<Esc>", "<C-\\><C-N>")
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')
keymap("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>")

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>")

-- Snacks
keymap("n", "<leader>ff", "<cmd>lua Snacks.picker.files()<CR>")
keymap("n", "<leader>fg", "<cmd>lua Snacks.picker.grep()<CR>")
keymap("n", "<leader><space>", "<cmd>lua Snacks.picker.smart()<CR>")
keymap("n", "<leader>gg", "<cmd>lua Snacks.lazygit()<CR>")

-- DAP
keymap("n", "<F5>", function()
	dap.continue()
end)

keymap("n", "<F10>", function()
	dap.step_over()
end)

keymap("n", "<F11>", function()
	dap.step_into()
end)

keymap("n", "<S-F11>", function()
	dap.step_out()
end)

keymap("n", "<F9>", function()
	dap.toggle_breakpoint()
end)

-- ----------------------------------------------
-- Auto commands
-- ----------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 170 })
	end,
	group = highlight_group,
})

-- Format on save
autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.cmd("colorscheme catppuccin")
