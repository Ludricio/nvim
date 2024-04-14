return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		local wk = require("which-key")
		wk.setup()
		require("which-key").register({
			["<leader>c"] = { name = "[c]ode", _ = "which_key_ignore" },
			["<leader>d"] = { name = "[d]ocument", _ = "which_key_ignore" },
			["<leader>r"] = { name = "[r]ename", _ = "which_key_ignore" },
			["<leader>s"] = { name = "[s]earch", _ = "which_key_ignore" },
			["<leader>p"] = { name = "[p]roject", _ = "which_key_ignore" },
			["<leader>e"] = { name = "[e] Diagnostics", _ = "which_key_ignore" },
		})
	end,
}