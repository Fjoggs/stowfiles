return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			sync_install = false,
			auto_install = false,
			ignore_install = {},
			modules = {},
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"svelte",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"python",
				"vimdoc",
				"go",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-s-w>",
					node_incremental = "<C-s-w>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
