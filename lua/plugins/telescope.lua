return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		---@class telescope.Config
		require("telescope").setup({
			-- winblend = 100,
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			extensions = {
				live_grep_args = {},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				["aerial"] = {
					format_symbol = function(symbol_path, filetype)
						if filetype == "json" or filetype == "yaml" then
							return table.concat(symbol_path, ".")
						else
							return symbol_path[#symbol_path]
						end
					end,
					show_columns = "both",
				},
			},
			defaults = {
				dynamic_preview_title = true,
				layout_strategy = "vertical",
				layout_config = { width = 120 },
				file_ignore_patterns = { "^.git/" },
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "aerial")
		pcall(require("telescope").load_extension, "live_grep_args")
	end,
}
