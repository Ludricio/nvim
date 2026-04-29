return {
	"tpope/vim-sleuth",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = true,
				},
			})
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				delay = 300,
			})
		end,
	},

	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			focus = true,
			open_no_results = true,
			auto_close = true,
			-- use_diagnostic_signs = true,
		},
	},
	{
		"stevearc/aerial.nvim",
		-- Optional dependencies
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({
				filter_kind = false,
				close_on_select = true,
				autojump = true,
			})
		end,
	},
	{
		"lambdalisue/suda.vim",
		lazy = false,
	},
}
