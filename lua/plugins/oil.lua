-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	config = function()
-- 		require("nvim-tree").setup({
-- 			view = {
-- 				centralize_selection = true,
-- 				number = true,
-- 				relativenumber = true,
-- 				width = {
-- 					max = -1,
-- 				},
-- 				adaptive_size = true,
-- 			},
-- 			modified = {
-- 				enable = true,
-- 			},
-- 			actions = {
-- 				open_file = {
-- 					quit_on_open = true,
-- 					window_picker = { enable = false },
-- 				},
-- 			},
-- 			diagnostics = {
-- 				enable = true,
-- 				show_on_dirs = true,
-- 			},
-- 		})
-- 	end,
-- }

return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@diagnostic disable-next-line: undefined-doc-name
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	config = function()
		require("oil").setup({
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
			},
			columns = {
				"icon",
				-- "mtime", --not fond of this
			},
		})
	end,
}
