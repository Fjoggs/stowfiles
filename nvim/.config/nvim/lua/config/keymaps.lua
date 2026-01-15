-- LEADER KEY IS SET IN lazy.lua
-- LEADER KEY IS SET IN lazy.lua
-- LEADER KEY IS SET IN lazy.lua

local keymap = vim.keymap
local wk = require("which-key")

keymap.set("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>", { desc = "Source neovim config file" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- scroll with center screen
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go half a page down and center the screen" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go half a page up and center the screen" })

-- save with ctrl+s
keymap.set({ "n", "i" }, "<C-s>", "<esc>:wa<CR>", { desc = "Save all buffers" })

-- navigate splits
keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })

-- LSP
keymap.set("n", "gR", vim.lsp.buf.references, { desc = "Show LSP references" }) -- show definition, references
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to definition" })
keymap.set("n", "<F18>", vim.lsp.buf.rename, { desc = "Rename variable" }) -- F18 = Shift + F6
keymap.set("n", "<S-F6>", vim.lsp.buf.rename, { desc = "Rename variable" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" }) -- show diagnostics for line
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" }) -- jump to previous diagnostic in buffer
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" }) -- jump to next diagnostic in buffer
keymap.set("n", "<C-p>", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" }) -- show documentation for what is under cursor
keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" }) -- mapping to restart lsp if necessary

-- nvim-tree
-- ¹ is opt+1
keymap.set("n", "¹", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<a-1>", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file

-- FzfLua
local fzf = require("fzf-lua")
keymap.set(
	{ "n", "v" },
	"<C-space>",
	"<cmd>FzfLua lsp_code_actions<cr>",
	{ desc = "See availabel code action", silent = true }
) -- see available code actions, in visual mode will apply to selection
keymap.set("n", "<C-n>", "<cmd>FzfLua files<cr>", { desc = "Find files" })

wk.add({
	{ "<leader>f", group = "FzLua commands" },
	{ "<leader>fc", "<cmd>FzfLua grep_cword<cr>", desc = "Find word under cursor" },
	{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "See open buffers" },
	{
		"<leader>fq",
		function()
			fzf.lgrep_quickfix()
		end,
		desc = "Find in quickfix",
	},
	{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Find in opened files history" },
	{
		"<leader>fs",
		function()
			fzf.live_grep()
		end,
		desc = "Find string in cwd",
	},
})

-- <F36> = CTRL+F12
keymap.set("n", "<F36>", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Find symbols in document" })
keymap.set("n", "<C-F12>", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Find symbols in document" })

-- <F47> = CTRL+Shift+F12
--
keymap.set("n", "<F48>", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "Find symbols in workspace" })
keymap.set("n", "<C-S-F12>", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "Find symbols in workspace" })

-- Diagnostics
keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Show buffer diagnostics" }) -- show  diagnostics for file
