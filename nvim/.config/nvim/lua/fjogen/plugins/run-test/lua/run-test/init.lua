-- local api = vim.api
-- local buf, win
--
-- local function open_window()
-- 	buf = api.nvim_create_buf(false, true) -- create new emtpy buffer
--
-- 	api.nvim_buf_set_option(buf, "bufhidden", "wipe")
--
-- 	-- get dimensions
-- 	local width = api.nvim_get_option("columns")
-- 	local height = api.nvim_get_option("lines")
--
-- 	-- calculate our floating window size
-- 	local win_height = math.ceil(height * 0.8 - 4)
-- 	local win_width = math.ceil(width * 0.8)
--
-- 	-- and its starting position
-- 	local row = math.ceil((height - win_height) / 2 - 1)
-- 	local col = math.ceil((width - win_width) / 2)
--
-- 	-- set some options
-- 	local opts = {
-- 		style = "minimal",
-- 		relative = "editor",
-- 		width = win_width,
-- 		height = win_height,
-- 		row = row,
-- 		col = col,
-- 	}
--
-- 	-- and finally create it with buffer attached
-- 	win = api.nvim_open_win(buf, true, opts)
-- end
--

local ts_utils = require("nvim-treesitter.ts_utils")
local ts_parsers = require("nvim-treesitter.parsers")

local get_master_node = function()
	local node = ts_utils.get_node_at_cursor()
	if node == nil then
		error("No node found.")
	end
	return node
end

local function run_python_test()
	local parser = ts_parsers.get_parser(vim.api.nvim_win_get_buf(0))
	local node = get_master_node()
	local current_buffer = vim.api.nvim_get_current_buf()
	ts_utils.update_selection(current_buffer, node)
	local node_text = vim.treesitter.get_node_text(node, current_buffer, {})
	print("node text is " .. node_text)

	local file = vim.fn.expand("%:p")
	-- local api = vim.api
	-- local buffer = api.nvim_create_buf(false, true)
	-- vim.cmd.split()
	-- api.nvim_win_set_buf(api.nvim_get_current_win(), buffer)
	print("my file is oog " .. file)

	-- api.nvim_command(
	-- 	":r!/home/fjogen/projects/dnb/remote/portal-backend/scripts/run-test.sh tests.handler.vitec.test_create_portal.TestCreatePortal.test_create_new_portal_samsolgt_missing_attributes"
	-- )
end

vim.api.nvim_create_user_command("RunPythonTest", run_python_test, { nargs = "*" })
vim.keymap.set("n", "<leader>rt", ":RunPythonTest<cr>", { desc = "Run test" })

return {
	run_test = run_python_test,
}
