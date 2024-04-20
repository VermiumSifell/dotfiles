local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local gears = require("gears")
local beautiful = require("beautiful")

local interface = "wlan0"

local command = string.format("ip addr show %s | grep -oE '([[:digit:]]{1,3}.){3}[[:digit:]]{1,3}/' | cut -d'/' -f1", interface)

-- Create the text widget
local ip_widget = wibox.widget {
    {
      widget = wibox.widget.textbox,
      text = "󰈀",
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
        awful.spawn.easy_async_with_shell(
            string.format('bash -c "%s"', command),
            function(stdout, stderr, reason, exit_code)
                ip = string.gsub(stdout, "[\n\r]", "")

                if (ip ~= "") then
                    ip_widget:get_children_by_id("text")[1]:set_text(" " .. ip)
                else
                    ip_widget.widget.text = string.format("%s down", interface)
                end
            end)
    end
}

-- Export the widget
return ip_widget
