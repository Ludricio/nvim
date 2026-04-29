return {
	"seblyng/roslyn.nvim",
	ft = "cs",
	config = function()
		print("Configuring Roslyn with correct options structure")

		-- 1. Grab the capabilities so Roslyn knows we support hover and signatures
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		require("roslyn").setup({
			-- 2. EVERYTHING related to the LSP server itself MUST go inside this config table!
			config = {
				capabilities = capabilities,

				on_attach = function()
					print("Roslyn successfully attached and hooked in!")
				end,

				settings = {
					["csharp|formatting"] = {
						dotnet_organize_imports_on_format = true,
					},
					["csharp|inlay_hints"] = {
						csharp_enable_inlay_hints_for_implicit_object_creation = true,
						csharp_enable_inlay_hints_for_implicit_variable_types = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
				},
			},
		})
	end,
}
