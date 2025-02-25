return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			enabled = true,
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 100,
				keymap = {
					accept = "<M-x>",
					dismiss = "<esc>",
					next = "<M-CR>",
				},
			},
			panel = {
				enabled = false,
				auto_refresh = false,
				keymap = {
					accept = "<CR>",
					refresh = "gr",
					open = "<M-Space>",
				},
				layout = {
					position = "bottom",
					ratio = 0.4,
				},
			},
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {},
	},
}
