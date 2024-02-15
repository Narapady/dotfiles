-- Pull in the wezterm API
local wezterm = require("wezterm")
local colors = require("lua/nightfox").colors()
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- font
config.font = wezterm.font("Fira Code")
-- font size
config.font_size = 15
-- colorscheme
-- config.color_scheme = "kanagawabones"
config.colors = colors
-- background imaged
-- config.background = {
-- 	{
-- 		source = {
-- 			File = {
-- 				path = "/Users/narapadychhuoy/Documents/wallpaper/devain/Wezterm Blue.gif",
-- 				speed = 0.2,
-- 			},
-- 		},
-- 		hsb = { brightness = 0.1 },
-- 		vertical_align = "Middle",
-- 		opacity = 0.8,
-- 		height = "Cover",
-- 		width = "Cover",
-- 	},
-- }
-- high window baggVGnr
config.window_decorations = "RESIZE"
-- window background opacity
config.window_background_opacity = 1
-- window background blur
config.macos_window_background_blur = 80
-- no tab bar
config.enable_tab_bar = false
-- window padding
config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 30,
}
-- return the configuration to wezterm
return config
