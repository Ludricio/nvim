vim.api.nvim_create_user_command("CleanMissingBuffers", function()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		local name = vim.api.nvim_buf_get_name(bufnr)
		local shortname = vim.fn.bufname(bufnr)
		if name ~= "" and vim.fn.filereadable(name) == 0 and shortname ~= "copilot-chat" then
			vim.api.nvim_buf_delete(bufnr, { force = true })
		end
	end
end, {})
