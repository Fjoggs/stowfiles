local function create_buffer()
	local buffers = vim.api.nvim_list_bufs()
	local buffer_exists = false
	local buffer
	for _, x in pairs(buffers) do
		local name = vim.api.nvim_buf_get_name(x)
		if name:find("find%-replace%-buffer") then
			buffer = x
			buffer_exists = true
		end
	end
	if not buffer_exists then
		buffer = vim.api.nvim_create_buf(true, true)
		vim.api.nvim_buf_set_name(buffer, "find-replace-buffer")
	end
	vim.cmd.vsplit()
	vim.api.nvim_win_set_buf(vim.api.nvim_get_current_win(), buffer)
	local search_term = vim.fn.input("Search term: ")
	print(search_term)
end

vim.api.nvim_create_user_command("FindAndReplace", create_buffer, { nargs = "*" })
vim.keymap.set("n", "<C-S-r>", ":FindAndReplace<cr>", { desc = "Open the find-and-replace buffer" })
