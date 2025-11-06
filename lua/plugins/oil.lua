return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@diagnostic disable-next-line: undefined-doc-name
	---@type oil.SetupOpts
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
			},
			columns = {
				"icon",
			},
			float = {
				max_width = 120,
				border = "rounded",
			},
			confirmation = {
				border = "rounded",
			},
			progress = {
				border = "rounded",
			},
			keymaps_help = {
				border = "rounded",
			},
		})
	end,
}
