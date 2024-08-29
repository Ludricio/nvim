return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		local wk = require("which-key")
		wk.setup()
		-- require("which-key").register({
		-- 	["<leader>c"] = { name = "[c]ode", _ = "which_key_ignore" },
		-- 	["<leader>r"] = { name = "[r]ename", _ = "which_key_ignore" },
		-- 	["<leader>s"] = { name = "[s]earch", _ = "which_key_ignore" },
		-- 	["<leader>p"] = { name = "[p]roject", _ = "which_key_ignore" },
		-- 	["<leader>d"] = { name = "[d]iagnostics", _ = "which_key_ignore" },
		-- 	["<leader>g"] = { name = "[g]it", _ = "which_key_ignore" },
		-- 	["<leader>h"] = { name = "[h]arpoon", _ = "which_key_ignore" },
		-- 	["<leader>t"] = { name = "[t]odo", _ = "which_key_ignore" },
		-- })
		require("which-key").add({
			{ "<leader>c", group = "[c]ode" },
			{ "<leader>c_", hidden = true },
			{ "<leader>d", group = "[d]iagnostics" },
			{ "<leader>d_", hidden = true },
			{ "<leader>g", group = "[g]it" },
			{ "<leader>g_", hidden = true },
			{ "<leader>h", group = "[h]arpoon" },
			{ "<leader>h_", hidden = true },
			{ "<leader>p", group = "[p]roject" },
			{ "<leader>p_", hidden = true },
			{ "<leader>r", group = "[r]ename" },
			{ "<leader>r_", hidden = true },
			{ "<leader>s", group = "[s]earch" },
			{ "<leader>s_", hidden = true },
			{ "<leader>t", group = "[t]odo" },
			{ "<leader>t_", hidden = true },
		})
	end,
}
