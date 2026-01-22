local wezterm = require("wezterm")

local act = wezterm.action
local M = {
        -- Right click sends "woot" to the terminal
        {
                event = { Down = { streak = 1, button = "Right" } },
                mods = "NONE",
                action = act.PasteFrom("PrimarySelection"),
        },
}

return M
