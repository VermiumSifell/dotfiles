local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local gears = require("gears")
local beautiful = require("beautiful")

-- local command = "top -bn1 | grep load | awk \'{printf "CPU Load: %.2f\n", $(NF-2)}\'"
local command = 'iwgetid -r'

---| CREATE CUSTOM WIFI WIDGET |---

-- create empty textbox widget -- 
local text_wifi_name = wibox.widget {
    widget = wibox.widget.textbox
}

local update_wifi_name =
    function(wifi) text_wifi_name.text = " " .. wifi end

-- fill the textbox widget with the output of the shell script --
gears.timer {
    timeout = 10,
    call_now = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async(command,
                               function(stdout)
            local wifi = stdout
            update_wifi_name(wifi)

        end)

    end
}

-- create a container for the widget -- 
container_wifi_widget = {
    {
        {
            {widget = text_wifi_name},
            left = 10,
            right = 10,
            top = 6,
            bottom = 6,
            widget = wibox.container.margin
        },
        fg = beautiful.catppuccin_peach,
        bg = beautiful.catppuccin_surface0,
        widget = wibox.container.background
    },
    top = 5,
    bottom = 5,
    widget = wibox.container.margin
}

return container_wifi_widget
