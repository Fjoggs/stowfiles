return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	config = function()
		vim.lsp.enable("basedpyright")

		-- Cooler looking icons for diagnostics
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = signs.Error,
					[vim.diagnostic.severity.WARN] = signs.Warn,
					[vim.diagnostic.severity.HINT] = signs.Hint,
					[vim.diagnostic.severity.INFO] = signs.Info,
				},
			},
		})
	end,
}
