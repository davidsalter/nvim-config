-- ~/.config/nvim-new/plugin/keymaps.lua
local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>")

keymap("n", "j", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true }) -- Move down, but use 'gj' if no count is given
keymap("n", "k", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true }) -- Move up, but use 'gk' if no count is given
keymap("n", "<C-d>", "<C-d>zz") -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz") -- Scroll up and center the cursor
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s) -- Open a new tab
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", s) -- Split the window vertically
keymap("n", "<Leader>-", "<cmd>split<CR>", s) -- Split the window horizontally
keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s) -- Format the current buffer using LSP
keymap("v", "<Leader>p", '"_dP') -- Paste without overwriting the default register
keymap("x", "y", [["+y]], s) -- Yank to the system clipboard in visual mode
keymap("t", "<Esc>", "<C-\\><C-N>") -- Exit terminal mode
-- Change directory to the current file's directory
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')

local opts = { noremap = true, silent = true }
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition

keymap("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>")
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>")

-- Snacks
keymap("n", "<leader>ff", "<cmd>lua Snacks.picker.files()<CR>")
keymap("n", "<leader>fg", "<cmd>lua Snacks.picker.grep()<CR>")
keymap("n", "<leader><space>", "<cmd>lua Snacks.picker.smart()<CR>")
keymap("n", "<leader>gg", "<cmd>lua Snacks.lazygit()<CR>")

-- DAP
local dap = require("dap")
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
