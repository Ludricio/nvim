-- function LineNumberColors()
-- 	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
-- 	vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
-- 	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
-- end

return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("tokyonight-night")
			vim.cmd.hi("Comment gui=none")
		end,
		---@class tokyonight.Config
		opts = {
			style = "storm",
			transparent = true,

			styles = {
				sidebars = "transparent",
				floats = "transparent",
				-- comments = { italic = false },
				-- keywords = { italic = false },
			},
			terminal_colors = true,
			---@type table<string, boolean|{enabled:boolean}>
			plugins = {
				auto = true,
				markdown = true,
				telescope = true,
				cmp = true,
				gitsigns = true,
				["indent-line"] = true,
			},
			on_highlights = function(hl, c) end,
			-- cache = true,
			-- on_colors = function(colors)
			-- 	colors.green = "#EBBCBA"
			-- end,
		},
	},
}
