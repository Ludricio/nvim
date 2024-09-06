return {
{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		enabled = true,
		lazy = false,
		opts = {
			enabled = true,
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<C-x>",
					dismiss = "<esc>",
					next = "<C-z>",
					prev = "<C-S-Z>",
				},
			},
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
}
