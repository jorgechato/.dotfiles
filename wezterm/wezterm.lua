local wezterm = require 'wezterm'
local config = {}

local palette = {
    bg = '#0d1016',
}

config.colors = {
    cursor_bg = 'white',
    cursor_border = 'white',
    background = palette.bg,

    tab_bar = {
        background = palette.bg,
        active_tab = {
            bg_color = palette.bg,
            fg_color = "white",
        },
        inactive_tab = {
            bg_color = "black",
            fg_color = "grey",
        },
        inactive_tab_hover = {
            bg_color = "black",
            fg_color = "white",
        },
        new_tab = {
            bg_color = palette.bg,
            fg_color = "grey",
        },
        new_tab_hover = {
            bg_color = palette.bg,
            fg_color = "white",
        },
    },
}

config.window_frame = {
    font_size = 13.0,
    active_titlebar_bg = palette.bg,
    inactive_titlebar_bg = "black"
}

config.window_padding = {
    top = 45,
}

config.use_fancy_tab_bar = true
config.color_scheme = 'Github Dark (Gogh)'

-- config.font = wezterm.font('Meslo LGS Nerd Font Mono')
config.font = wezterm.font('MesloLGSDZ Nerd Font Mono')
config.font_size = 14.0

config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.keys = {
    { key = '-', mods = 'CTRL',       action = wezterm.action.DisableDefaultAssignment },
    { key = '+', mods = 'CTRL',       action = wezterm.action.DisableDefaultAssignment },
    { key = '|', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal },
    { key = '_', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical },
    { key = 'k', mods = 'SUPER',      action = wezterm.action.ClearScrollback("ScrollbackAndViewport") },
}

return config
