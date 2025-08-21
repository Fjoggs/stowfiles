--vim.g.mapleader = " "
local wk = require("which-key")
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- replace clg with console.log
keymap.set("i", "clg", "<ESC>:i<CR>console.log('')<CR><BS><ESC>ci'")

-- navigate with ctrl+h,j,k,l
-- handled by nvim-tmux-navigator now
-- keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
-- keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
-- keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
-- keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- scroll with center screen
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go half a page down and center the screen" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go half a page up and center the screen" })

-- save with ctrl+s
keymap.set({ "n", "i" }, "<C-s>", "<esc>:wa<CR>", { desc = "Save all buffers" })

-- flash
local flash = require("flash")
keymap.set({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "Flash" })

keymap.set({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, { desc = "Flash Treesitter" })

keymap.set("o", "r", function()
	flash.remote()
end, { desc = "Remote Flash" })

keymap.set({ "o", "x" }, "R", function()
	flash.treesitter_search()
end, { desc = "Treesitter Search" })

keymap.set("c", "c-s", function()
	flash.toggle()
end, { desc = "Toggle Flash Search" })

-- window management
wk.add({
	{ "<leader>s", group = "Split management" },
	{ "<leader>se", ":wincmd =<CR>", desc = "Make splits equal size" },
	{ "<leader>sh", "<C-w>s", desc = "Split window horizontally" },
	{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split window" },
	{ "<leader>sv", "<C-w>v", desc = "Split window vertically" },
	{ "<leader>sx", "<cmd>close<CR>", desc = "Close current split" },
})

-- Tab management
wk.add({
	{ "<leader>t", group = "Tab management" },
	{ "<leader>tf", "<cmd>tabnew $<CR>", desc = "Open current buffer in new tab" },
	{ "<leader>tn", "<cmd>tabn<CR>", desc = "Close current tab" },
	{ "<leader>to", "<cmd>tabnew<CR>", desc = "Open new tab" },
	{ "<leader>tp", "<cmd>tabp<CR>", desc = "Go to previous tab" },
	{ "<leader>tx", "<cmd>tabclose<CR>", desc = "Close current tab" },
})

-- Git management/Fuzzy finding
keymap.set("n", "gR", function()
	require("fzf-lua").lsp_references()
end, { desc = "Show LSP references" }) -- show definition, references

keymap.set("n", "gd", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- go to declaration

wk.add({
	{ "<leader>g", group = "Git management" },
	{ "<leader>gn", ":Neogit<CR>", desc = "Open NeoGit integration" },
	{
		"<leader>gb",
		function()
			require("fzf-lua").git_blame()
		end,
		desc = "Open git blame (buffer)",
	},
	{
		"<leader>gd",
		function()
			require("fzf-lua").git_commits()
		end,
		desc = "Open git commit log (buffer)",
	},
	{
		"<leader>gl",
		function()
			require("fzf-lua").git_commits()
		end,
		desc = "Open git commit log (project)",
	},
})

-- Session management
wk.add({
	{ "<leader>w", group = "Session management" },
	{ "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session for cwd" },
	{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session for cwd" },
})

-- Debugger

local dap = require("dap")
local dap_ui_widgets = require("dap.ui.widgets")

keymap.set("n", "<F5>", function()
	dap.continue()
end)
keymap.set("n", "<F8>", function()
	dap.step_over()
end)
keymap.set("n", "<F7>", function()
	dap.step_into()
end)
keymap.set("n", "<F12>", function()
	dap.step_out()
end)
keymap.set("n", "<Leader>b", function()
	dap.toggle_breakpoint()
end)
keymap.set("n", "<Leader>B", function()
	dap.set_breakpoint()
end)
keymap.set("n", "<Leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)

wk.add({
	{ "<leader>d", group = "Debugger" },
	{
		"<leader>df",
		function()
			dap_ui_widgets.centered_float(dap_ui_widgets.frames)
		end,
		desc = "Centered float DAP frames",
	},
	{
		"<leader>dh",
		function()
			dap_ui_widgets.hover()
		end,
		desc = "Show DAP hover widget",
	},
	{
		"<leader>dl",
		function()
			dap.run_last()
		end,
		desc = "Run last DAP",
	},
	{
		"<leader>dp",
		function()
			dap_ui_widgets.preview()
		end,
		desc = "Show DAP preview widget",
	},
	{ "<leader>dr", ":DapToggleRepl<CR>", desc = "Toggles the DAP repl" },
	{
		"<leader>ds",
		function()
			dap_ui_widgets.centered_float(dap_ui_widgets.scopes)
		end,
		desc = "Centered float DAP scopes",
	},
})

-- Undotree
keymap.set("n", "<leader>u", "<cmd>:UndotreeToggle<CR>", { desc = "Shows the undo tree" })

-- Formatting
wk.add({
	{ "<leader>l", group = "Linting" },
})

vim.keymap.set({ "n", "v" }, "<leader>lf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })

local lint = require("lint")
vim.keymap.set("n", "<leader>ll", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })

-- Nvim tree
wk.add({
	{ "<leader>e", group = "File tree explorer" },
	{ "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
	{ "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
	{ "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
	{ "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
})

-- ¹ is opt+1
keymap.set("n", "¹", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<a-1>", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file

-- fzf-lua
keymap.set("n", "<C-n>", "<cmd>FzfLua files<cr>", { desc = "Find files" })

wk.add({
	{ "<leader>f", group = "FzLua commands" },
	{ "<leader>fc", "<cmd>FzfLua grep_cword<cr>", desc = "Find word under cursor" },
	{
		"<leader>fq",
		function()
			require("fzf-lua").lgrep_quickfix()
		end,
		desc = "Find in quickfix",
	},
	{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Find in opened files history" },
	{
		"<leader>fs",
		function()
			require("fzf-lua").live_grep()
		end,
		desc = "Find string in cwd",
	},
})

-- Zen mode
keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle({
		window = {
			width = 0.85, -- width will be 85% of the editor width
		},
	})
end, { desc = "Toggle zenmode" }) --  move current buffer to new tab

-- <F36> = CTRL+F12
keymap.set("n", "<F36>", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Find symbols in document" })
keymap.set("n", "<C-F12>", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Find symbols in document" })

-- <F47> = CTRL+Shift+F12
--
keymap.set("n", "<F48>", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "Find symbols in workspace" })
keymap.set("n", "<C-S-F12>", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "Find symbols in workspace" })

-- Diagnostics
keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Show buffer diagnostics" }) -- show  diagnostics for file

wk.add({
	{ "<leader>hh", ":lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostic under line in floating window" },
})
