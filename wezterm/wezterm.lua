local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 13
config.font = wezterm.font_with_fallback({
	"FiraCode Nerd Font",
	"D2CodingLigature Nerd Font",
})
config.color_scheme = "catppuccin-mocha"

return config
