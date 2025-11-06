return {
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		config = function()
			require("ibl").setup({
				debounce = 100,
				indent = {
					char = "▏",
					tab_char = "▏",
				},
				whitespace = {
					highlight = {
						"NonText",
					},
				},
				scope = { show_end = true },
			})
		end,
	},
}
