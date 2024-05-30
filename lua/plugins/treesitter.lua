return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "bash", "c", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
		-- Autoinstall languages that are not installed
		auto_install = true,
		autotag = {
			enable = true,
			filetypes = {
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"svelte",
				"vue",
				"tsx",
				"jsx",
				"rescript",
				"css",
				"lua",
				"xml",
				"php",
				"markdown",
			},
		}, -- Automatically close and rename HTML/XML tags
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		textobjects = {
			swap = {
				enable = true,
				swap_next = {
					["<leader>csa"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>cS"] = "@parameter.inner",
				},
			},
		},
	},
	config = function(_, opts)
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)
	end,
}
