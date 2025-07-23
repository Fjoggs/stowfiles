return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			log_level = "error",
			auto_save = false,
			auto_restore = false,
			suppressed_dirs = {
				"~/",
				"~/Downloads",
				"~/Documents",
				"~/Desktop/",
				"~/downloads",
				"~/documents",
				"~/desktop/",
			},
		})
	end,
}
