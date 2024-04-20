local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local config = require("config")

awful.keyboard.append_global_keybindings({
    --awful.key({"Mod4"}, "Return",
              --function() awful.spawn(config.apps.terminal) end,
              --{description = "open a terminal", group = "launcher"}),

    --awful.key({"Mod4"}, "d", function()
        --awful.spawn("rofi -combi-modi drun,window -show drun")
    --end, {description = "show launcher", group = "launcher"}),

    --awful.key({"Mod4"}, "x", function() awful.spawn("rofimoji") end,
              --{description = "show emoji picker", group = "launcher"}),
--
    --awful.key({"Mod4"}, "q",
              --function() awful.spawn(config.actions.show_calculator) end,
              --{description = "show calculator", group = "launcher"})
})
