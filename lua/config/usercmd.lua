-- Helper function to "steal" native LSP completions
local function lsp_complete(native_cmd)
	return function(arg_lead)
		-- Asks Neovim what the native completion would be for this command
		return vim.fn.getcompletion(native_cmd .. " " .. arg_lead, "cmdline")
	end
end

-- LspInfo stays a simple command since it doesn't take arguments
vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", { desc = "View LSP health/status" })

-- LspStart, LspStop, and LspRestart need to accept arguments and autocomplete
vim.api.nvim_create_user_command("LspStart", function(opts)
	vim.cmd("lsp enable " .. opts.args)
end, {
	nargs = "?", -- Accepts 0 or 1 argument
	desc = "Start/Enable LSP",
	complete = lsp_complete("lsp enable"),
})

vim.api.nvim_create_user_command("LspStop", function(opts)
	vim.cmd("lsp disable " .. opts.args)
end, {
	nargs = "?",
	desc = "Stop/Disable LSP",
	complete = lsp_complete("lsp disable"),
})

vim.api.nvim_create_user_command("LspRestart", function(opts)
	vim.cmd("lsp restart " .. opts.args)
end, {
	nargs = "?",
	desc = "Restart LSP",
	complete = lsp_complete("lsp restart"),
})
