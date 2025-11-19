-- LSP Configuration & Plugins
return {
	"neovim/nvim-lspconfig",
	lazy = false,
	events = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"b0o/schemastore.nvim",
		-- Useful status updates for LSP.
		{
			"j-hui/fidget.nvim",
			opts = {
				notification = {
					window = {
						border = "rounded",
					},
				},
			},
		},
		-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		-- { "folke/neodev.nvim", opts = {} },
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		-- LSP servers and clients are able to communicate to each other what features they support.
		--  By default, Neovim doesn't support everything that is in the LSP specification.
		--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		vim.diagnostic.config({
			virtual_text = {
				enable = true,
				severity = {
					min = vim.diagnostic.severity.HINT,
				},
			},
		})

		local servers = {
			lua_ls = {
				-- cmd = {...},
				-- filetypes = { ...},
				-- capabilities = {},
				settings = {
					Lua = {
						hint = {
							enable = true,
						},
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},
			cssls = {
				settings = {
					css = {
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			},
			powershell_es = {
				settings = {
					powershell = {
						enableProfileLoading = false,
						debugging = {
							createTemporaryIntegratedConsole = true,
						},
					},
					pester = {
						codeLens = false,
						debugOutputVerbosity = "Diagnostic",
					},
				},
			},
			jsonls = {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			},
			yamlls = {
				settings = {
					yaml = {
						schemaStore = {
							enable = true,
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			},
		}

		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		})

		-- You can add other tools here that you want Mason to install
		-- for you, so that they are available from within Neovim.
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
			"eslint",
			"clangd",
			"cssls",
			"html",
			"intelephense",
			"jsonls",
			"markdown-toc",
			-- "markdownlint-cli2",
			"marksman",
			"prettierd",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			ensure_installed = { "jsonls" },
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

					print("Configuring LSP server: " .. server_name)
					print(vim.inspect(server))
					vim.lsp.config(server_name, server)
					-- require("lspconfig")[server_name].setup(server)
				end,
			},
		})
		for name, config in pairs(servers) do
			vim.lsp.config(name, config)
		end
	end,
}
