return {
	dependencies = {
		"sainnhe/edge",
		"marko-cerovac/material.nvim",
		"rose-pine/neovim",
		"folke/tokyonight.nvim",
	},
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		-- styles "dark", "darker", "cool", "deep", "warm", "warmer"
		require("onedark").setup({
			style = "dark",
		})
		require("onedark").load()
	end,
}
