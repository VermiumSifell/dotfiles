local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local gears = require("gears")
local beautiful = require("beautiful")

-- local command = "top -bn1 | grep load | awk \'{printf "CPU Load: %.2f\n", $(NF-2)}\'"
local command = 'top -bn1 | grep load | awk \'{printf "%.f%", $(NF-2)}\''

-- create empty textbox widget --
local text_cpu_name = wibox.widget {widget = wibox.widget.textbox}

local update_cpu_name = function(cpu) text_cpu_name.text = " " .. cpu end

-- fill the textbox widget with the output of the shell script --
gears.timer {
    timeout = 10,
    call_now = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async_with_shell(command, function(stdout)
            local cpu = stdout
            update_cpu_name(cpu)

        end)

    end
}

-- create a container for the widget --
container_cpu_widget = {
    {
        {widget = text_cpu_name},
        top = beautiful.top_panel_inner_margin_top,
        bottom = beautiful.top_panel_inner_margin_bottom,
        right = beautiful.top_panel_inner_margin_right,
        left = beautiful.top_panel_inner_margin_left,

        widget = wibox.container.margin
    },
    fg = beautiful.catppuccin_red,
    bg = beautiful.catppuccin_surface0,-- Would be cool to set bg color, lavender, yellow, red, based on CPU usage
    widget = wibox.container.background
}

return container_cpu_widget
