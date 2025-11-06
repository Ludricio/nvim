return {
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			---@diagnostic disable-next-line: missing-fields
			config = {
				-- your configuration comes here; leave empty for default settings
				-- NOTE: You must configure `cmd` in `config.cmd` unless you have installed via mason
				settings = {
					["csharp|formatting"] = {
						dotnet_organize_imports_on_format = true,
					},
				},
			},
		},
	},
}
