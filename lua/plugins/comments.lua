return {
	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(buffnr)
				local gs = package.loaded.gitsigns
				local function nmap(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = buffnr
					vim.keymap.set(mode, l, r, opts)
				end

				nmap("n", "<leader>gb", function()
					gs.blame_line({ full = false })
				end, { desc = "git [b]lame line" })
				nmap("n", "<leader>gd", gs.diffthis, { desc = "git [d]iff against index" })
				nmap("n", "<leader>gD", function()
					gs.diffthis("~")
				end, { desc = "git [D]iff against last commit" })
			end,
		},
	},
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
