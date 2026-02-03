local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

local is_windows = wezterm.target_triple:find("windows") ~= nil
local mod = "CMD"

if is_windows then
    config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }
    config.initial_cols = 120
    mod = "ALT"
end

config = {
    -- Spawn a fish shell in login mode
    --font = "FiraCode Nerd Font Mono Retina",
    -- You can specify some parameters to influence the font selection;
    -- for example, this selects a Bold, Italic font variant.
    font = wezterm.font("SauceCodePro Nerd Font Mono", { weight = "Regular", italic = false }),
    --font = wezterm.font("CodeNewRoman Nerd Font Mono", { weight = "Bold", italic = false }),
    --font = wezterm.font("Hurmit Nerd Font Mono", { weight = "Regular", italic = false }),
    font_size = 14.0,
    line_height = 1,
    font_rules = {
        {
            intensity = "Normal",
            italic = true,
            font = wezterm.font("SauceCodePro Nerd Font Mono", { weight = "Regular", italic = false }),
        },
        {
            intensity = "Bold",
            italic = true,
            font = wezterm.font("SauceCodePro Nerd Font Mono", { weight = "Bold", italic = false }),
        },
    },
    color_scheme = "Dracula (Official)",
    use_fancy_tab_bar = false,
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    tab_max_width = 64,
    -- window_decorations = "RESIZE",
    window_padding = {
        left = "1.0cell",
        right = "0.2cell",
        top = "0.4cell",
        bottom = "0.2cell",
    },
    colors = {
        tab_bar = {
            -- The color of the strip that goes along the top of the window
            -- (does not apply when fancy tab bar is in use)
            background = "#282a36",

            -- The active tab is the one that has focus in the window
            active_tab = {
                -- The color of the background area for the tab
                bg_color = "#6b798e",
                -- The color of the text for the tab
                fg_color = "#c0c0c0",

                -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
                -- label shown for this tab.
                -- The default is "Normal"
                intensity = "Normal",

                -- Specify whether you want "None", "Single" or "Double" underline for
                -- label shown for this tab.
                -- The default is "None"
                underline = "None",

                -- Specify whether you want the text to be italic (true) or not (false)
                -- for this tab.  The default is false.
                italic = false,

                -- Specify whether you want the text to be rendered with strikethrough (true)
                -- or not for this tab.  The default is false.
                strikethrough = false,
            },

            -- Inactive tabs are the tabs that do not have focus
            inactive_tab = {
                bg_color = "#282a36",
                fg_color = "#808080",

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `inactive_tab`.
            },

            -- The new tab button that let you create new tabs
            new_tab = {
                bg_color = "#282a36",
                fg_color = "#808080",

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `new_tab`.
            },
        },
    },
    mouse_bindings = require("mouse_binding"),
}

config.keys = {
    -- 垂直分屏 (左右) - Command + d
    {
        key = 'd',
        mods = 'CMD',
        action = act.SplitPane {
            direction = 'Right',
            size = { Percent = 50 },
        },
    },
    -- 水平分屏 (上下) - Command + Shift + d
    {
        key = 'D',
        mods = 'CMD|SHIFT',
        action = act.SplitPane {
            direction = 'Down',
            size = { Percent = 50 },
        },
    },
    -- 关闭当前分屏 - Command + w
    {
        key = 'w',
        mods = 'CMD',
        action = act.CloseCurrentPane { confirm = true },
    },
    { key = 'h', mods = mod, action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'l', mods = mod, action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'k', mods = mod, action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'j', mods = mod, action = wezterm.action.ActivatePaneDirection 'Down' },
}

return config
