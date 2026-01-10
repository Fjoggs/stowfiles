-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- general settings
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12
local oceanicScheme = wezterm.color.get_builtin_schemes()["MaterialDesignColors"]
local oceanicColor = "#25363B"
oceanicScheme.background = oceanicColor

config.color_schemes = {
	-- Override the builtin Gruvbox Light scheme with our modification.
	["Material Oceanic"] = oceanicScheme,
}
--
config.color_scheme = "Material Oceanic"

-- window
config.window_background_opacity = 0.75

config.window_frame = {
	border_left_width = "0px",
	border_right_width = "0px",
	border_top_height = "0px",
	border_bottom_height = "0px",
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- colors
config.colors = {
	tab_bar = {
		background = oceanicColor,

		active_tab = {
			bg_color = oceanicColor,
			fg_color = "#F5B74F",
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = oceanicColor,
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},
	},
}

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
