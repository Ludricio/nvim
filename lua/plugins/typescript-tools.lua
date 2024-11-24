-- local api = require("typescript-tools.api")
-- local diagnosticFilters = api.filter_diagnostics(
-- 	-- Ignore 'This may be converted to an async function' diagnostics.
-- 	{ 80006 }
-- )

return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = function()
		local api = require("typescript-tools.api")
		local diagnosticFilters = api.filter_diagnostics(
			-- Ignore 'This may be converted to an async function' diagnostics.
			{ 80006 }
		)
		return {
			on_attach = function()
				vim.keymap.set("n", "<leader>ci", api.add_missing_imports, { desc = "Add missing imports" })
				vim.keymap.set("n", "<leader>cu", api.remove_unused_imports, { desc = "Remove unused imports" })
				vim.keymap.set("n", "<leader>co", api.organize_imports, { desc = "Organize imports" })
			end,
			settings = {
				expose_as_code_action = "all",
			},
			handlers = {
				["textDocument/publishDiagnostics"] = diagnosticFilters,
			},
		}
	end,
}
