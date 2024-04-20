local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local gears = require("gears")
local beautiful = require("beautiful")

local interface = "wlo1"

-- Configure widget appearance
local memory_widget_font = beautiful.font -- Set the font here (family, name, size...) e.g. "sans 12"
local memory_widget_fg_color = "#ffffff"

local command = 'free -m | awk \'/Mem/{printf "%.1f/%.1fGB (%.2f%%)", $3/1024,$2/1024,$3*100/$2}\''

-- Create the text widget
local memory_widget = wibox.widget {
    {
        widget = wibox.widget.textbox,
        text = "󰍛",
        font = beautiful.icon_font
    },
    {
        widget = wibox.widget.textbox,
        id = "text"
    },
    widget = wibox.layout.fixed.horizontal
}

gears.timer {
    timeout = 10, -- seconds
    call_now = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async_with_shell(command, function(stdout, stderr, reason, exit_code)
            memory_widget:get_children_by_id("text")[1]:set_text(" " .. stdout)
        end)
    end
}

-- Export the widget
return memory_widget
