require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmd")

require("lspconfig").tsserver.setup({
	on_attach = function(client, bufnr)
		local ns = vim.lsp.diagnostic.get_namespace(client.id)
		vim.diagnostic.disable(bufnr, ns)
	end,
})
