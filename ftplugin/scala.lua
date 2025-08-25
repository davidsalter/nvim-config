local dap = require("dap")
local autocmd = vim.api.nvim_create_autocmd

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
	statusBarProvider = "log",
	isHttpEnabled = true,
	debuggingProvider = true,
	icons = "unicode",
}

require("metals").initialize_or_attach(metals_config)
