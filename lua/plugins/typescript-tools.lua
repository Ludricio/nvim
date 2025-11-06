-- local api = require("typescript-tools.api")
-- local diagnosticFilters = api.filter_diagnostics(
-- 	-- Ignore 'This may be converted to an async function' diagnostics.
-- 	{ 80006 }
-- )
--
return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	-- cond = function() {
	-- 	local
	-- }
	config = function()
		local api = require("typescript-tools.api")
		require("typescript-tools").setup({
			on_attach = function()
				vim.keymap.set("n", "<leader>ci", api.add_missing_imports, { desc = "Add missing imports" })
				vim.keymap.set("n", "<leader>cu", api.remove_unused_imports, { desc = "Remove unused imports" })
				vim.keymap.set("n", "<leader>co", api.organize_imports, { desc = "Organize imports" })
			end,
			settings = {
				tsserver_max_memory = "auto",
				expose_as_code_action = {
					"fix_all",
					"add_missing_imports",
					"remove_unused",
					"organize_imports",
					"remove_unused_imports",
				},
				separate_diagnostic_server = true,
				publish_diagnostic_on = "insert_leave",
			},
			code_lens = "off",
			disable_member_code_lens = true,
		})
	end,
}
