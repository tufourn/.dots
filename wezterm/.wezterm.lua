local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Remove all padding
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- F11 to toggle fullscreen mode
config.keys = {
	{ key = "F11", action = wezterm.action.ToggleFullScreen },
}

-- Theme
config.color_scheme = "rose-pine-dawn"

-- Remove titlebar
config.window_decorations = "RESIZE"

-- disable ligature
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

return config
