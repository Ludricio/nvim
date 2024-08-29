return {
	on_attach = function(client, bufnr)
		-- vim.print("ESLint-LSP attached")
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
	settings = {
		rulesCustomizations = {
			-- { rule = "@typescript-eslint/no-unused-vars", severity = "off" },
		},
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		-- lintTask = {
		-- 	enable = true,
		-- },
		experimental = {
			useFlatConfig = false,
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		problems = {
			shortenToSingleLine = false,
		},
		quiet = false,
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectories = {
			mode = "auto",
		},
	},
}
