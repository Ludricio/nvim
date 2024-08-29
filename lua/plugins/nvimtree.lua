vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				centralize_selection = true,
				number = true,
				relativenumber = true,
				width = {
					-- min = "50%",
					max = -1,
				},
				adaptive_size = true,
			},
			modified = {
				enable = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = { enable = false },
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			renderer = {
				-- highlight_modified = "all",
				-- highlight_git = "all",
				-- highlight_diagnostics = "all",
			},
		})
	end,
}
