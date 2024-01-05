-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- font
config.font = wezterm.font("Hack")
-- font size
config.font_size = 16
-- colorscheme
config.color_scheme = "Solarized Dark - Patched"

-- dim the brightness of the background image
local dimmer = { brightness = 0.1 }
-- background image
config.background = {
	{
		source = {
			File = {
				path = "/Users/narapadychhuoy/Documents/wallpaper/devain/Erica Anderson.gif",
				speed = 0.2,
			},
		},
		hsb = dimmer,
		vertical_align = "Middle",
		opacity = 0.85,
		height = "Cover",
		width = "Cover",
	},
}
-- high window bar
config.window_decorations = "RESIZE"
-- window background opacity
config.window_background_opacity = 0.9
-- window background blur
config.macos_window_background_blur = 60
-- no tab bar
config.enable_tab_bar = false
-- window padding
config.window_padding = {
	left = 30,
	right = 30,
	top = 20,
	bottom = 20,
}
-- return the configuration to wezterm
return config
