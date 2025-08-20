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

vim.cmd("colorscheme catppuccin")

vim.diagnostic.config({
  signs = {
	 text = {
		[vim.diagnostic.severity.ERROR] = "󰅙",
		[vim.diagnostic.severity.WARN] = "",
		[vim.diagnostic.severity.HINT] = "󰌵",
		[vim.diagnostic.severity.INFO] = "󰋼",
	},
},
  virtual_text = true,  -- show inline messages
  virtual_lines = { current_line = true },
  icons = true,
  underline = true,     -- underline problematic text
  update_in_insert = false, -- don't update diagnostics while typing
  severity_sort = true,     -- sort diagnostics by severity
})

