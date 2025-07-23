return {
	"folke/which-key.nvim",
	dependencies = { "echasnovski/mini.nvim", version = "*" },
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,

	opts = {
		-- empty to use default settings
	},
}
