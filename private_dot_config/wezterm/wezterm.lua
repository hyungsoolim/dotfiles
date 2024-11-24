-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- font ===================================================
config.font = wezterm.font('D2CodingLigature Nerd Font')
config.font_size = 13

-- window =================================================
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10
config.window_decorations = 'RESIZE'
-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'


-- and finally, return the configuration to wezterm
return config