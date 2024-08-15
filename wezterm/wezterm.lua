-- Pull in the wezterm API
local wezterm = require("wezterm")
local wt_action = require("wezterm").action
local colors = require("lua/tokyonight").colors()
local k = require("utils.keys")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- font
config.font = wezterm.font("InputMono Nerd Font", { weight = "Regular", italic = false })
-- font size
config.font_size = 15
config.line_height = 1.2
-- colorscheme
-- config.colors = colors
config.color_scheme = 'Catppuccin Mocha (Gogh)'

-- config.background = {
--   {
--     source = {
--       File = {
--         path = "/Users/narapadychhuoy/Downloads/Sunset Kanagawa Dragon.jpg",
--         speed = 0.2,
--       },
--     },
--     hsb = { brightness = 0.05 },
--     vertical_align = "Middle",
--     opacity = 0.9,
--     height = "Cover",
--     width = "Cover",
--   },
-- }
config.keys = {
  k.cmd_to_tmux_prefix("1", "1"),
  k.cmd_to_tmux_prefix("2", "2"),
  k.cmd_to_tmux_prefix("3", "3"),
  k.cmd_to_tmux_prefix("4", "4"),
  k.cmd_to_tmux_prefix("k", "k"),
  k.cmd_to_tmux_prefix("/", "/"),
  k.cmd_to_tmux_prefix("d", "d"),
  k.cmd_to_tmux_prefix("s", "s"),
  k.cmd_to_tmux_prefix("g", "g"),
  k.cmd_to_tmux_prefix("e", "e"),
  k.cmd_to_tmux_prefix("l", "l"),
  k.cmd_to_tmux_prefix("n", "n"),
  k.cmd_to_tmux_prefix("p", "p"),
  k.cmd_to_tmux_prefix("t", "c"),
}
-- high window baggVGnr
config.window_decorations = "RESIZE"
-- window background opacity
config.window_background_opacity = 0.7
-- window background blur
config.macos_window_background_blur = 100
-- no tab bar
config.enable_tab_bar = false
-- window padding
config.window_padding = {
  left = 20,
  right = 20,
  top = 5,
  bottom = 0,
}

-- return the configuration to wezterm
return config
