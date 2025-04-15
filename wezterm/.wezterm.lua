local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Remove all padding
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Theme
config.color_scheme = "rose-pine-dawn"

-- Remove titlebar
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false

-- Disable ligature
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- font
config.font_size = 14

-- Initial window size
config.initial_rows = 48
config.initial_cols = 120

return config
