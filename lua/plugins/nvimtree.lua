vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = { enable = false },
				},
			},
			diagnostics = {
				enable = true,
			},
		})
	end,
}
