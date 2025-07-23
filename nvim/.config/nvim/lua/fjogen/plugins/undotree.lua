return {
	"mbbill/undotree",
	cmd = "UndotreeToggle", -- Load only when command is used
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle undotree" },
	},
	config = function()
		-- Optional configuration
		vim.g.undotree_WindowLayout = 2 -- Layout style
		vim.g.undotree_SplitWidth = 40 -- Width of undotree window
		vim.g.undotree_SetFocusWhenToggle = 1 -- Focus undotree when toggled
		vim.g.undotree_ShortIndicators = 1 -- Use short time indicators
	end,
}
