local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local command = 'top -bn1 | grep load | awk \'{printf "%.f%", $(NF-2)}\''

local function create_cpu_widget()
    local cpu_textbox = wibox.widget {widget = wibox.widget.textbox}

    local function update_cpu_name(cpu)
        cpu_textbox.text = " " .. cpu
    end

    gears.timer {
        timeout = 10,
        call_now = true,
        autostart = true,
        callback = function()
            awful.spawn.easy_async_with_shell(command, update_cpu_name)
        end
    }

    local container_cpu_widget = {
        {
            {widget = cpu_textbox},
            top = beautiful.top_panel_inner_margin_top,
            bottom = beautiful.top_panel_inner_margin_bottom,
            right = beautiful.top_panel_inner_margin_right,
            left = beautiful.top_panel_inner_margin_left,
            widget = wibox.container.margin
        },
        fg = beautiful.catppuccin_red,
	-- Would be cool to set bg color, lavender, yellow, red, based on CPU usage
        bg = beautiful.catppuccin_surface0,
        widget = wibox.container.background
    }

    return container_cpu_widget
end

return create_cpu_widget()
