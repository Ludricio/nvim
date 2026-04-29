return {
	"romus204/tree-sitter-manager.nvim",
	dependencies = {}, -- tree-sitter CLI must be installed system-wide
	config = function()
		require("tree-sitter-manager").setup({
			-- Default Options
			ensure_installed = {
				"jsx",
				"c",
				"c_sharp",
				"javascript",
				"typescript",
				"tsx",
				"php_only",
				"php",
				"html_tags",
				"html",
				"angular",
				"bash",
				"dockerfile",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"json",
				"jsdoc",
				"zsh",
				"yaml",
				"xml",
				"markdown",
			}, -- list of parsers to install at the start of a neovim session
			-- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
			auto_install = true, -- if enabled, install missing parsers when editing a new file
			highlight = true, -- treesitter highlighting is enabled by default
			languages = {}, -- override or add new parser sources
			-- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
			-- query_dir = vim.fn.stdpath("data") .. "/site/queries",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
