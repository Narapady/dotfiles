-- Pull in the wezterm API
local wezterm = require("wezterm")
local colors = require("lua/onedark").colors()
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- font
config.font = wezterm.font("Hack Nerd Font", { weight = "Regular", italic = false })
-- font size
config.font_size = 15
-- colorscheme
config.colors = colors
-- background imaged
-- config.background = {
-- 	{
-- 		source = {
-- 			File = {
-- 				path = "/Users/narapadychhuoy/Documents/wallpaper/Nord/Groot wallpaper.png",
-- 				speed = 0.2,
-- 			},
-- 		},
-- 		hsb = { brightness = 1 },
-- 		vertical_align = "Middle",
-- 		opacity = 0.9,
-- 		height = "Cover",
-- 		width = "Cover",
-- 	},
-- }
-- high window baggVGnr
config.window_decorations = "RESIZE"
-- window background opacity
config.window_background_opacity = 0.9
-- window background blur
config.macos_window_background_blur = 100
-- no tab bar
config.enable_tab_bar = false
-- window padding
config.window_padding = {
	left = 20,
	right = 10,
	top = 10,
	bottom = 10,
}

-- return the configuration to wezterm
return config
