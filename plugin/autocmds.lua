-- ~/.config/nvim-new/plugin/autocmds.lua
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

autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

local metals_config = require("metals").bare_config()

metals_config.tvp = {
	icons = {
		enabled = true,
	},
}

metals_config.settings = {
	showImplicitArguments = true,
	showInferredType = true,
	superMethodLensesEnabled = true,
	showImplicitConversionsAndClasses = true,
	enableSemanticHighlighting = true,
}
metals_config.init_options = {
	statusBarProvider = "off",
	isHttpEnabled = true,
	debuggingProvider = true,
	icons = "unicode",
}

autocmd("FileType", {
	pattern = { "scala", "sbt" },
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
})

vim.cmd([[
  augroup lsp_code_lens_refresh
    autocmd!
    autocmd BufEnter,CursorHold,InsertLeave *.scala lua vim.lsp.codelens.refresh()
  augroup END
]])

vim.lsp.handlers["textDocument/codeLens"] = vim.lsp.codelens.on_codelens
