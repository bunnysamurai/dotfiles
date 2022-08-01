local wezterm = require("wezterm")
local util = require("util")
local keybinds = require("keybinds")

-- set term to wezterm if the def exists.
-- disabled because it makes ssh kind of a chore
local term_cfg = "xterm-256color"
-- if string.find(wezterm.target_triple, 'linux') ~= nil then
--     if os.execute('infocmp wezterm > /dev/null 2>&1') then
--         term_cfg = "wezterm"
--     end
-- end

local font_cfg = wezterm.font_with_fallback({ "Iosevka Term", "JetBrains Mono", "Noto Color Emoji",
    "Symbols Nerd Font Mono", "Last Resort High-Efficiency" })

local config = {
    automatically_reload_config = true,
    term = term_cfg,
    font = font_cfg,
    font_size = 12,
    launch_menu = { {
        args = { "btop" }
    } },
    colors = {
        foreground = "#bbbbbb",
        background = "#121212",
        cursor_bg = "#bbbbbb",
        cursor_border = "#bbbbbb",
        cursor_fg = "#ffffff",
        selection_bg = "#b5d5ff",
        selection_fg = "#000000",

        ansi = { "#121212", "#fa2573", "#98e123", "#dfd460", "#1080d0", "#8700ff", "#43a8d0", "#bbbbbb" },
        brights = { "#555555", "#f6669d", "#b1e05f", "#fff26d", "#00afff", "#af87ff", "#51ceff", "#ffffff" },

        visual_bell = '#333300',
    },
    leader = keybinds.leader,
    keys = keybinds.keys,
    hide_tab_bar_if_only_one_tab = true,
    visual_bell = {
        fade_in_function = 'Linear',
        fade_in_duration_ms = 40,
        fade_out_function = 'EaseOut',
        fade_out_duration_ms = 150,
    },
    audible_bell = "Disabled"
}

return config
