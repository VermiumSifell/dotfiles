local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local gears = require("gears")
local beautiful = require("beautiful")

local command =
    "ip link show | awk '$2 ~ /^e/ && $9 == \"UP\" {print \"Connected\"} END {print \"Disconnected\"}'"

---| CREATE CUSTOM WIFI WIDGET |---

-- create empty textbox widget -- 
local text_ethernet_name = wibox.widget {widget = wibox.widget.textbox}

local update_ethernet_name = function(status)
    text_ethernet_name.text = "󰈀 " .. status
end

-- fill the textbox widget with the output of the shell script --
gears.timer {
    timeout = 1,
    call_now = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async_with_shell(command, update_ethernet_name)
    end
}

-- create a container for the widget -- 
container_ethernet_widget = {
    {
        {widget = text_ethernet_name},
        top = beautiful.top_panel_inner_margin_top,
        bottom = beautiful.top_panel_inner_margin_bottom,
        right = beautiful.top_panel_inner_margin_right,
        left = beautiful.top_panel_inner_margin_left,

        widget = wibox.container.margin
    },
    fg = beautiful.catppuccin_mauve,
    bg = beautiful.catppuccin_surface0,
    widget = wibox.container.background
}

return container_ethernet_widget
