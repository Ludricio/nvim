-- Autoformat
return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[c]ode [f]ormat",
		},
	},
	opts = {
		log_level = vim.log.levels.DEBUG,
		notify_on_error = true,
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
		-- format_on_save = function(bufnr)
		-- 	-- Disable "format_on_save lsp_fallback" for languages that don't
		-- 	-- have a well standardized coding style. You can add additional
		-- 	-- languages here or re-enable it for the disabled ones.
		-- 	local disable_filetypes = { c = true, cpp = true }
		-- 	return {
		-- 		timeout_ms = 500,
		-- 		lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		-- 	}
		-- end,
		formatters = {
			prettier = {
				cli_options = {
					config_precedence = "prefer-file",
				},
			},
			csharpier = {
				command = "csharpier",
				args = { "format", "--write-stdout", "--no-cache", "$FILENAME" },
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			cs = { "csharpier" },
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			-- markdown = { { "prettierd", "prettier" } },
		},
	},
}
