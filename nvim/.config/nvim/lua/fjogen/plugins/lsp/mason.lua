return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "basedpyright", "ruff" },
		})
	end,
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
