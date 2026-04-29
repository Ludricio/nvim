return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"lewis6991/async.nvim",
	},
	config = function()
		require("refactoring").setup()
	end,
}
