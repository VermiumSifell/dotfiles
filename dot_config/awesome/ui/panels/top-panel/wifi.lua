local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local gears = require("gears")
local beautiful = require("beautiful")

-- local command = "top -bn1 | grep load | awk \'{printf "CPU Load: %.2f\n", $(NF-2)}\'"
local command = 'iwgetid -r'

---| CREATE CUSTOM WIFI WIDGET |---

-- create empty textbox widget -- 
local text_wifi_name = wibox.widget {widget = wibox.widget.textbox}

local update_wifi_name = function(wifi)
    if wifi == '' then
        text_wifi_name.text = "󰖪 " .. "Disconnected"
    else
        text_wifi_name.text = " " .. wifi
    end
end

-- fill the textbox widget with the output of the shell script --
gears.timer {
    timeout = 10,
    call_now = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async(command, function(stdout)
            local wifi = stdout
            update_wifi_name(wifi)

        end)

    end
}

-- create a container for the widget -- 
container_wifi_widget = {
    {
        {widget = text_wifi_name},
        top = beautiful.top_panel_inner_margin_top,
        bottom = beautiful.top_panel_inner_margin_bottom,
        right = beautiful.top_panel_inner_margin_right,
        left = beautiful.top_panel_inner_margin_left,

        widget = wibox.container.margin
    },
    fg = beautiful.catppuccin_sapphire,--crust,
    bg = beautiful.catppuccin_surface0, --mauve,--lavender, --surface0,
    widget = wibox.container.background
}

return container_wifi_widget
