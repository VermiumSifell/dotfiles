-- Load config
local config = require("config")

-- Load theme
local beautiful = require("beautiful") -- Theme handling library
local theme = config.places.theme .. "/2023.lua" -- Path to theme
beautiful.init(theme) -- Initialize the theme

require("keybindings")
require("other")
require("ui")

-- Standard awesome library
local awful = require("awful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title = "Oops, an error happened" ..
            (startup and " during startup!" or "!"),
        message = message
    }
end)

ruled.notification.connect_signal("request::rules", function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule = {},
        properties = {screen = awful.screen.preferred, implicit_timeout = 5}
    }
end)

naughty.connect_signal("request::display",
                       function(n) naughty.layout.box {notification = n} end)

-- Startup
awful.spawn("autorandr -c")
awful.spawn("picom")

---@diagnostic disable: param-type-mismatch
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
---@diagnostic enable: param-type-mismatch
