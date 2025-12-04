-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- general settings
config.font_size = 12
config.color_scheme = "MaterialOcean"
config.window_background_opacity = 0.5

-- keybinds
config.keys = {}

-- extending quick select (ctrl+shift+space)
config.quick_select_patterns = {
	"\\b[A-Z]{4}-[A-Z]{4}\\b", -- Matches AWS code
}

-- Here to show what's possible
wezterm.on("format-tab-title", function(tab)
	local title = tab.window_title
	return title
end)

-- Finally, return the configuration to wezterm:
return config
