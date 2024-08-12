local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

return function(s)
    mytextclock = wibox.widget.textclock("󰥔 %H:%M:%S", 1)

    -- Clock widget
    container_clock_widget = {
        {
            {widget = mytextclock},
            top = beautiful.top_panel_inner_margin_top,
            bottom = beautiful.top_panel_inner_margin_bottom,
            right = beautiful.top_panel_inner_margin_right,
            left = beautiful.top_panel_inner_margin_left,

            widget = wibox.container.margin
        },
        fg = beautiful.catppuccin_text,
        bg = beautiful.catppuccin_surface0,
	shape = gears.shape.rounded_bar,
        widget = wibox.container.background
    }

    return container_clock_widget
end
