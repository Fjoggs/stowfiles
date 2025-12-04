-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- general settings
config.font_size = 12
config.color_scheme = "MaterialOcean"
config.window_background_opacity = 0.5

-- tabs
config.hide_tab_bar_if_only_one_tab = true

-- keybinds with leader key
config.leader = { key = "a", mods = "CTRL" }
config.keys = {
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Rename Tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{ key = "h", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneDirection("Right") },
}

-- extending quick select (ctrl+shift+space)
config.quick_select_patterns = {
	"\\b[A-Z]{4}-[A-Z]{4}\\b", -- Matches AWS code
}

-- functions
wezterm.on("update-status", function(window, pane)
	local leader = ""
	if window:leader_is_active() then
		leader = "Leader"
	end
	window:set_left_status(wezterm.format({
		{ Attribute = { Underline = "Single" } },
		{ Attribute = { Italic = true } },
		{ Text = leader },
	}))
end)

-- Finally, return the configuration to wezterm:
return config
